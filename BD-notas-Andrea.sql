-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci ;
USE `DB` ;

-- -----------------------------------------------------
-- Table `DB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`users` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`notes` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL,
  `description` LONGTEXT NULL,
  `creation_date` DATETIME NULL,
  `last_modified_date` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  `users_Id` INT NOT NULL,
  `discard_note` TINYINT NULL,
  PRIMARY KEY (`Id`, `users_Id`),
  INDEX `fk_notes_users1_idx` (`users_Id` ASC),
  CONSTRAINT `fk_notes_users1`
    FOREIGN KEY (`users_Id`)
    REFERENCES `DB`.`users` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`notes_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`notes_has_category` (
  `notes_Id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`notes_Id`, `category_id`),
  INDEX `fk_notes_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_notes_has_category_notes1_idx` (`notes_Id` ASC),
  CONSTRAINT `fk_notes_has_category_notes1`
    FOREIGN KEY (`notes_Id`)
    REFERENCES `DB`.`notes` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notes_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `DB`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
