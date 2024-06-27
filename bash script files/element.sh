#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table   --tuples-only -c"

ELEMENT=$1

if [[ -z $ELEMENT ]]
 then
   echo  "Please provide an element as an argument."
  else 
    if [[ $ELEMENT =~ ^[0-9]+$ ]]
     then 
     QUERY_RESULT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number=$ELEMENT")
       if [[ -z $QUERY_RESULT ]]
       then
       echo -e "\nI could not find that element in the database.\n"
       else
            echo "$QUERY_RESULT" | while  read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR MASS BAR MELTING BAR BOILING BAR TYPE
             do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
              done
       fi
    
     else
      QUERY_RESULT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE symbol='$ELEMENT' or name='$ELEMENT'")
            if [[ -z $QUERY_RESULT ]]
             then
              echo I could not find that element in the database.
              else
            echo "$QUERY_RESULT" | while  read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR MASS BAR MELTING BAR BOILING BAR TYPE 
            do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
            done
    
            fi
    

     fi
      # ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE   symbol='$ELEMENT' OR name='$ELEMENT'")
  
     
      # echo "$ELEMENT" | while read ATOMIC_NUM BAR SYMBOL BAR NAME
      #  do

      #  echo $ATOMIC_NUM
      #  done
       
     if [[ -z $ELEMENT ]]
      then
       echo I could not find that element in the database.

      fi
     
 fi
