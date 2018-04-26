-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puzzle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `puzzle` ;

CREATE TABLE IF NOT EXISTS `puzzle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size` INT NULL,
  `imageURL` VARCHAR(1000) NULL,
  `name` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventory_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory_item` ;

CREATE TABLE IF NOT EXISTS `inventory_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `condition` ENUM('USED', 'NEW', 'WORN', 'LIKE_NEW') NULL,
  `puzzle_id` INT NOT NULL,
  `owner_id` INT NOT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_information` ;

CREATE TABLE IF NOT EXISTS `user_information` (
  `id` INT NOT NULL,
  `address` VARCHAR(1000) NOT NULL,
  `email` VARCHAR(100) NULL,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_information_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_information_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category_puzzle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_puzzle` ;

CREATE TABLE IF NOT EXISTS `category_puzzle` (
  `puzzle_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  INDEX `fk_puzzle_id_idx` (`puzzle_id` ASC),
  INDEX `fk_category_id_idx` (`category_id` ASC),
  CONSTRAINT `fk_puzzle_id`
    FOREIGN KEY (`puzzle_id`)
    REFERENCES `puzzle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `borrow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `borrow` ;

CREATE TABLE IF NOT EXISTS `borrow` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inventory_item_id` INT NOT NULL,
  `borrow_date` DATE NULL,
  `return_date` DATE NULL,
  `loaner_id` INT NOT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puzzle_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `puzzle_rating` ;

CREATE TABLE IF NOT EXISTS `puzzle_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NOT NULL,
  `comment` VARCHAR(1000) NULL,
  `puzzle_id` INT NULL,
  `user_id` INT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_rating` ;

CREATE TABLE IF NOT EXISTS `user_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NOT NULL,
  `comment` VARCHAR(1000) NULL,
  `rated_user_id` INT NULL,
  `rater_user_id` INT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `request` ;

CREATE TABLE IF NOT EXISTS `request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `requester_id` INT NOT NULL,
  `requestee_id` INT NOT NULL,
  `message` VARCHAR(1000) NULL,
  `inventory_id` INT NOT NULL,
  `accepted` TINYINT NOT NULL DEFAULT 0,
  `active` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_requester_id_to_user_idx` (`requester_id` ASC),
  INDEX `fk_inventory_id_to_ii_idx` (`inventory_id` ASC),
  INDEX `fk_requestee_id_to_user_idx` (`requestee_id` ASC),
  CONSTRAINT `fk_requester_id_to_user`
    FOREIGN KEY (`requester_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requestee_id_to_user`
    FOREIGN KEY (`requestee_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_id_to_ii`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin;
 DROP USER admin;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin' IDENTIFIED BY 'admin';

GRANT ALL ON * TO 'admin';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO ppuser;
 DROP USER ppuser;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'ppuser' IDENTIFIED BY 'ppuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'ppuser';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `user` (`id`, `username`, `password`) VALUES (1, 'alex', 'alex');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (2, 'julian', 'julian');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (3, 'miranda', 'miranda');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (4, 'xian', 'xian');

COMMIT;


-- -----------------------------------------------------
-- Data for table `puzzle`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (1, 100, 'pig.url', 'piggies');
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (2, 50, 'jungle.url', 'amazon');
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (3, NULL, 'space.url', 'our solar system');
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (4, 500, 'beach.url', 'beach');
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (5, 1000, 'ocean.url', 'underwater adventure');
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (6, 900, 'field.url', 'field of flowers');
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (7, 1500, 'robot.url', 'killer robots');
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (8, 1000, 'macaroni.url', 'macaroni factory');
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (9, NULL, 'peach.url', 'peaches and cream');
INSERT INTO `puzzle` (`id`, `size`, `imageURL`, `name`) VALUES (10, 500, 'doggie.url', 'cute dog eating icecream');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (1, 'LIKE_NEW', 1, 1);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (2, 'USED', 1, 1);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (3, 'NEW', 2, 2);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (4, 'NEW', 3, 3);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (5, 'LIKE_NEW', 4, 4);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (6, 'WORN', 5, 1);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (7, 'NEW', 6, 2);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (8, 'NEW', 7, 3);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (9, 'WORN', 8, 4);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (10, 'USED', 9, 1);
INSERT INTO `inventory_item` (`id`, `condition`, `puzzle_id`, `owner_id`) VALUES (11, 'NEW', 10, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_information`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `user_information` (`id`, `address`, `email`, `first_name`, `last_name`, `user_id`) VALUES (1, '123 Main Street', 'alex@verizon.net', 'alex', 'wagner', 1);
INSERT INTO `user_information` (`id`, `address`, `email`, `first_name`, `last_name`, `user_id`) VALUES (2, '456 Other Street', 'julian@aol.com', 'julian', 'goudy', 2);
INSERT INTO `user_information` (`id`, `address`, `email`, `first_name`, `last_name`, `user_id`) VALUES (3, '789 Dowry Lane', 'miranda@rr.net', 'miranda', 'martin', 3);
INSERT INTO `user_information` (`id`, `address`, `email`, `first_name`, `last_name`, `user_id`) VALUES (4, '1011 Newport Blvd', 'xian@google.com', 'xian', 'zheng', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'Pets');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'Ocean');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'Under the sea');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'Landscape');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'Flowers');
INSERT INTO `category` (`id`, `name`) VALUES (6, 'Space');
INSERT INTO `category` (`id`, `name`) VALUES (7, 'Animals');
INSERT INTO `category` (`id`, `name`) VALUES (8, 'Jungle');
INSERT INTO `category` (`id`, `name`) VALUES (9, 'Futuristic');
INSERT INTO `category` (`id`, `name`) VALUES (10, 'Food');
INSERT INTO `category` (`id`, `name`) VALUES (11, 'Architechture');
INSERT INTO `category` (`id`, `name`) VALUES (12, 'Superhero');
INSERT INTO `category` (`id`, `name`) VALUES (13, 'Cartoon');
INSERT INTO `category` (`id`, `name`) VALUES (14, 'Sports');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category_puzzle`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (1, 1);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (2, 8);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (3, 6);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (4, 2);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (5, 2);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (6, 5);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (7, 9);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (8, 10);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (9, 10);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (10, 10);
INSERT INTO `category_puzzle` (`puzzle_id`, `category_id`) VALUES (10, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `borrow`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `borrow` (`id`, `inventory_item_id`, `borrow_date`, `return_date`, `loaner_id`) VALUES (1, 1, '\'2018-01-01\'', '\'2018-02-01\'', 2);
INSERT INTO `borrow` (`id`, `inventory_item_id`, `borrow_date`, `return_date`, `loaner_id`) VALUES (2, 3, '\'2018-02-01\'', '\'2018-03-01\'', 4);
INSERT INTO `borrow` (`id`, `inventory_item_id`, `borrow_date`, `return_date`, `loaner_id`) VALUES (3, 9, '\'2018-03-01\'', '\'2018-04-01\'', 3);
INSERT INTO `borrow` (`id`, `inventory_item_id`, `borrow_date`, `return_date`, `loaner_id`) VALUES (4, 6, '\'2018-04-01\'', '\'2018-05-01\'', 4);
INSERT INTO `borrow` (`id`, `inventory_item_id`, `borrow_date`, `return_date`, `loaner_id`) VALUES (5, 2, '\'2018-05-01\'', '\'2018-06-01\'', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `puzzle_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (1, 4, 'good puzzle', 1, 1);
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (2, 5, 'awesome puzzle', 1, 2);
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (3, 2, 'bad puzzle', 2, 3);
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (4, 4, 'pretty good', 10, 4);
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (5, 5, 'best I\'ve ever done', 9, 4);
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (6, 4, 'pretty good', 7, 3);
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (7, 2, 'meh, boring', 2, 4);
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (8, 1, 'worst ever hate the dog', 10, 1);
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (9, 3, 'okay I guess', 5, 2);
INSERT INTO `puzzle_rating` (`id`, `rating`, `comment`, `puzzle_id`, `user_id`) VALUES (10, 3, 'its fine', 4, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `user_rating` (`id`, `rating`, `comment`, `rated_user_id`, `rater_user_id`) VALUES (1, 4, 'Awesome user', 1, 2);
INSERT INTO `user_rating` (`id`, `rating`, `comment`, `rated_user_id`, `rater_user_id`) VALUES (2, 3, 'okay I guess', 2, 1);
INSERT INTO `user_rating` (`id`, `rating`, `comment`, `rated_user_id`, `rater_user_id`) VALUES (3, 5, 'Best Ever!', 1, 3);
INSERT INTO `user_rating` (`id`, `rating`, `comment`, `rated_user_id`, `rater_user_id`) VALUES (4, 1, 'Horrible!', 2, 4);
INSERT INTO `user_rating` (`id`, `rating`, `comment`, `rated_user_id`, `rater_user_id`) VALUES (5, 5, 'favorite user!', 3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `request`
-- -----------------------------------------------------
START TRANSACTION;
USE `puzzlepieces`;
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (1, 2, 1, '\'Sure thing! Thanks for the request!\'', 1, 1, 1);
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (2, 4, 2, '\'I like this one! Go for it!\'', 3, 1, 1);
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (3, 3, 4, '\'Here ya go!\'', 9, 1, 1);
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (4, 4, 1, '\'Yes, it\'s on the way!\'', 6, 1, 1);
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (5, 3, 1, '\'Yep this is a fun one!\'', 2, 1, 1);
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (6, 1, 2, '\'No I don\'t like you\'', 7, 0, 0);
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (7, 1, 4, '\'Sorry I\'m holding on to this for a bit\'', 5, 0, 0);
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (8, 2, 3, '\'Don\'t want to\'', 8, 0, 0);
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (9, 3, 1, '\'Nuh-uh\'', 10, 0, 0);
INSERT INTO `request` (`id`, `requester_id`, `requestee_id`, `message`, `inventory_id`, `accepted`, `active`) VALUES (10, 2, 4, '\'Nope\'', 5, 0, 0);

COMMIT;
