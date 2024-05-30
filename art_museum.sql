
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `art_gallery` ;

-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `art_gallery` DEFAULT CHARACTER SET utf8 ;
USE `art_gallery` ;

-- -----------------------------------------------------
-- Table `art_gallery`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artist` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `mname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NOT NULL,
  `dob` int NOT NULL,
  `dod` int NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`),
  UNIQUE INDEX `artist_id_UNIQUE` (`artist_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art_gallery`.`art_work`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`art_work` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`art_work` (
  `art_work_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `year` INT NULL,
  `local` ENUM('n', 'y') NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `period` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`art_work_id`),
  UNIQUE INDEX `art_work_id_UNIQUE` (`art_work_id` ASC) VISIBLE,
  INDEX `fk_art_work_artist_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_art_work_artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `art_gallery`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art_gallery`.`file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`file` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`file` (
  `file_id` INT NOT NULL AUTO_INCREMENT,
  `file_name` TEXT NOT NULL,
  `art_work_id` INT NOT NULL,
  PRIMARY KEY (`file_id`),
  INDEX `fk_file_art_work1_idx` (`art_work_id` ASC) VISIBLE,
  CONSTRAINT `fk_file_art_work1`
    FOREIGN KEY (`art_work_id`)
    REFERENCES `art_gallery`.`art_work` (`art_work_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art_gallery`.`keywords`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`keywords` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`keywords` (
  `keywords_id` INT NOT NULL AUTO_INCREMENT,
  `keyword` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`keywords_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art_gallery`.`keywords_has_art_work`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`keywords_has_art_work` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`keywords_has_art_work` (
  `keywords_id` INT NOT NULL,
  `art_work_id` INT NOT NULL,
  PRIMARY KEY (`keywords_id`, `art_work_id`),
  INDEX `fk_keywords_has_art_work_art_work1_idx` (`art_work_id` ASC) VISIBLE,
  INDEX `fk_keywords_has_art_work_keywords1_idx` (`keywords_id` ASC) VISIBLE,
  CONSTRAINT `fk_keywords_has_art_work_keywords1`
    FOREIGN KEY (`keywords_id`)
    REFERENCES `art_gallery`.`keywords` (`keywords_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_keywords_has_art_work_art_work1`
    FOREIGN KEY (`art_work_id`)
    REFERENCES `art_gallery`.`art_work` (`art_work_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into artist(fname, mname, lname,dob,dod,country) values('Vincent', null, 'Van Gogh', 1853, 1890, 'France'), ('Rembrandt','Harmenszoon', 'van Rijn',1606,1669,'Netherlands'),
('Leonardo', null, 'da Vinci', 1452, 1519, 'Italy'),
('Venture','Lonzo','Coy',1965, null, 'United States'),
('Deborah',null, 'Gill',1970,null, 'United States'),
('Claude',null,'Monet',1840,1926,'France'),
('Pablo',null, 'Picasso',1904,1973,'Spain'),
('Michelangelo','di Lodovico','Simoni',1475,1564,'Italy');
select * from artist;

insert into art_work(title,year,local,type,period, artist_id) values('Irises',1889,'n','Oil','Impressionism',1), ('The Starry Night',1889,'n','Oil','Post-Impressionism',1), ('Sunflowers',1888,'n','Oil','Post-Impressionism',1), ('Night Watch',1642,'n','Oil','Baroque',2),('Storm of the Sea of Galilee',1633,'n','Oil','Dutch Golden Age',2), ('Head of a Woman',1508,'n','Oil','High Renaissance',3), ('Last Super',1498,'n','Tempra','Renaissance', 3), ('Mona Lisa',1517,'n','Oil','Renaissance',3), ('Hillside Stream',2005,'y','Oil','Modern',4), ('Old Barn', 1992,'y','Oil','Modern',4), ('Beach Baby',  1999, 'y','Watercolor','Modern',5), ('Woman in the Garden', 1866,'n','Oil','Impressionism',6), ('Old Guitarist', 1904, 'n','Oil','Modern', 7);

select * from art_work;

insert into file(file_name, art_work_id) values('irises.jpg',1),('starrynight.jpg',2),('sunflowers.jpg',3),('nightwatch.jpg',4),('stormgalilee.jpg',5),('headwoman.jpg',6),('lastsupper.jpg',7), ('monalisa.jpg',8), ('hillsidestream.jpg',9),('oldbarn.jpg',10),('beachbaby.jpg',11),('womengarden.jpg',12), ('guitarist.jpg',13);


insert into keywords(keyword) values('flowers'),('blue'),('landscape'),('girl'),('people'),('battle'),('boat'),('water'),('christ'),('food'),('ai'),('blue');



insert into keywords_has_art_work(keywords_id,art_work_id) values(1,1),(2,2),(3,2),(1,3),(4,4),(5,4),(6,4),(7,5),(8,5),(5,5),(4,6),(5,6),(10,7),(5,7),(9,7),(4,8),(5,8),(8,9),(3,9),(3,10),(11,11),(3,12),(5,12),(2,13),(5,13);