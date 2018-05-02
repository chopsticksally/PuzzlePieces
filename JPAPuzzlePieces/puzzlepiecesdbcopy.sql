-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema puzzlepieces
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `puzzlepieces` ;

-- -----------------------------------------------------
-- Schema puzzlepieces
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `puzzlepieces` DEFAULT CHARACTER SET utf8 ;
USE `puzzlepieces` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL DEFAULT NULL,
  `street2` VARCHAR(100) NULL DEFAULT NULL,
  `city` VARCHAR(200) NULL DEFAULT NULL,
  `state` VARCHAR(200) NULL DEFAULT NULL,
  `postal_code` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `puzzle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `puzzle` ;

CREATE TABLE IF NOT EXISTS `puzzle` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `size` INT(11) NULL DEFAULT NULL,
  `imageURL` VARCHAR(10000) NULL DEFAULT NULL,
  `name` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventory_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory_item` ;

CREATE TABLE IF NOT EXISTS `inventory_item` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `puzzle_condition` ENUM('USED', 'NEW', 'WORN', 'LIKE_NEW') NULL DEFAULT NULL,
  `puzzle_id` INT(11) NOT NULL,
  `owner_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_puzzle_idx` (`puzzle_id` ASC),
  INDEX `fk_user_owner_idx` (`owner_id` ASC),
  CONSTRAINT `fk_puzzle`
    FOREIGN KEY (`puzzle_id`)
    REFERENCES `puzzle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_owner`
    FOREIGN KEY (`owner_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `borrow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `borrow` ;

CREATE TABLE IF NOT EXISTS `borrow` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `inventory_item_id` INT(11) NOT NULL,
  `borrow_date` DATE NULL DEFAULT NULL,
  `return_date` DATE NULL DEFAULT NULL,
  `loaner_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inventory_item_idx` (`inventory_item_id` ASC),
  INDEX `fk_user_id_idx` (`loaner_id` ASC),
  CONSTRAINT `fk_inventory_item`
    FOREIGN KEY (`inventory_item_id`)
    REFERENCES `inventory_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`loaner_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `category_puzzle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_puzzle` ;

CREATE TABLE IF NOT EXISTS `category_puzzle` (
  `puzzle_id` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  INDEX `fk_puzzle_id_idx` (`puzzle_id` ASC),
  INDEX `fk_category_id_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_puzzle_id`
    FOREIGN KEY (`puzzle_id`)
    REFERENCES `puzzle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `puzzle_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `puzzle_rating` ;

CREATE TABLE IF NOT EXISTS `puzzle_rating` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `rating` INT(11) NOT NULL,
  `comment` VARCHAR(1000) NULL DEFAULT NULL,
  `puzzle_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_puzzle_rating_idx` (`puzzle_id` ASC),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_puzzle_rating`
    FOREIGN KEY (`puzzle_id`)
    REFERENCES `puzzle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id_to_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `request` ;

CREATE TABLE IF NOT EXISTS `request` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `requester_id` INT(11) NOT NULL,
  `requestee_id` INT(11) NOT NULL,
  `message` VARCHAR(1000) NULL DEFAULT NULL,
  `inventory_id` INT(11) NOT NULL,
  `accepted` TINYINT(4) NOT NULL DEFAULT '0',
  `active` TINYINT(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  INDEX `fk_requester_id_to_user_idx` (`requester_id` ASC),
  INDEX `fk_inventory_id_to_ii_idx` (`inventory_id` ASC),
  INDEX `fk_requestee_id_to_user_idx` (`requestee_id` ASC),
  CONSTRAINT `fk_inventory_id_to_ii`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requestee_id_to_user`
    FOREIGN KEY (`requestee_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requester_id_to_user`
    FOREIGN KEY (`requester_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_information` ;

CREATE TABLE IF NOT EXISTS `user_information` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `first_name` VARCHAR(100) NULL DEFAULT NULL,
  `last_name` VARCHAR(100) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `address_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_information_user1_idx` (`user_id` ASC),
  INDEX `fk_user_information_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_information_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_information_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_rating` ;

CREATE TABLE IF NOT EXISTS `user_rating` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `rating` INT(11) NOT NULL,
  `comment` VARCHAR(1000) NULL DEFAULT NULL,
  `rated_user_id` INT(11) NULL DEFAULT NULL,
  `rater_user_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_idx` (`rated_user_id` ASC),
  INDEX `fk_user_rater_idx` (`rater_user_id` ASC),
  CONSTRAINT `fk_user`
    FOREIGN KEY (`rated_user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_rater`
    FOREIGN KEY (`rater_user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
