#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~ Welcome to Ezekiel's Salon~~\n"



MAIN_MENU(){
   if [[ $1 ]]
   then 
    echo -e "\n$1"
   fi


  echo -e "Here are the services we offer\n"
  # select the services from the service table
SERVICES=$($PSQL "select service_id, name from services order by service_id")

  echo "$SERVICES" | while read SERVICE_NUMBER  BAR SERVICE_NAME
  do
    # echo the service id and the service name
  echo  "$SERVICE_NUMBER) $SERVICE_NAME"
  done
  
#  echo -e "\nWhat service in number, do you want?"
  

  read SERVICE_ID_SELECTED 
  # query the database for the service selected
 SERVICE_ID=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")
  # check if the service is available
if [[ -z $SERVICE_ID ]]
  then
   MAIN_MENU  "I could not find that service. What would you like today?"
  else
   echo -e "\nWhat's your phone number?"

   read CUSTOMER_PHONE
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_ID ]]
       then
      echo -e "\nI don't have a record for that phone number, what's your name?"
        
        read CUSTOMER_NAME 
    # create the customer record before booking an appointment for the customer
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE') ")
       if [[  $INSERT_CUSTOMER_RESULT == 'INSERT 0 1' ]]
        then 
         echo Your record has been entered
        else
         echo Something Happend that prevented us from taking down your record
       fi
    fi

       
   


 echo -e "\nWhat time would you like your Hair cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
     
       CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

 
    
    INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(time, service_id, customer_id) values('$SERVICE_TIME', $SERVICE_ID, $CUSTOMER_ID)")
    
    if [[ $INSERT_APPOINTMENT_RESULT == 'INSERT 0 1' ]]
     then 
       echo "Successfully booked your appointment"
     else
     
         echo Apointment failed to enter
     fi
      GET_APPOINTMENT=$($PSQL "select  services.name, customers.name, time from appointments inner join services using(service_id) join customers using(customer_id) where phone='$CUSTOMER_PHONE' order by appointment_id")
       
       echo "$GET_APPOINTMENT" | while read SERVICE BAR CUSTOMER BAR TIME
       do
       echo  -e "\nI have put you down for a $SERVICE at $TIME, $CUSTOMER."
         
       done
  fi
 
 
}

MAIN_MENU 
