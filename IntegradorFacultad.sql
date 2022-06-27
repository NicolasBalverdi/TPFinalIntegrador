-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema facultad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema facultad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `facultad` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `facultad` ;

-- -----------------------------------------------------
-- Table `facultad`.`Facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`Facultad` (
  `idFacultad` INT NOT NULL,
  PRIMARY KEY (`idFacultad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `facultad`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`Carrera` (
  `idCarrera` INT NOT NULL,
  `Facultad_idFacultad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `catidadDeMaterias` INT NOT NULL,
  PRIMARY KEY (`idCarrera`, `Facultad_idFacultad`),
  INDEX `fk_Carrera_Facultad1_idx` (`Facultad_idFacultad` ASC) VISIBLE,
  CONSTRAINT `fk_Carrera_Facultad1`
    FOREIGN KEY (`Facultad_idFacultad`)
    REFERENCES `facultad`.`Facultad` (`idFacultad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `facultad`.`Cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`Cuenta` (
  `idCuenta` INT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCuenta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `facultad`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`Administrador` (
  `idAdministrador` INT NOT NULL,
  PRIMARY KEY (`idAdministrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facultad`.`EstadoCurricular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`EstadoCurricular` (
  `idEstadoCurricular` INT NOT NULL,
  PRIMARY KEY (`idEstadoCurricular`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facultad`.`Alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`Alumno` (
  `idAlumno` INT NOT NULL,
  `EstadoCurricular_idEstadoCurricular` INT NOT NULL,
  `inscriptoCarrera` TINYINT NOT NULL,
  `inscriptoAExamen` TINYINT NOT NULL,
  PRIMARY KEY (`idAlumno`, `EstadoCurricular_idEstadoCurricular`),
  INDEX `fk_Alumno_EstadoCurricular1_idx` (`EstadoCurricular_idEstadoCurricular` ASC) VISIBLE,
  CONSTRAINT `fk_Alumno_EstadoCurricular1`
    FOREIGN KEY (`EstadoCurricular_idEstadoCurricular`)
    REFERENCES `facultad`.`EstadoCurricular` (`idEstadoCurricular`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facultad`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`Persona` (
  `idPersona` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `Facultad_idFacultad` INT NOT NULL,
  `Cuenta_idCuenta` INT NOT NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  `Alumno_idAlumno` INT NOT NULL,
  PRIMARY KEY (`idPersona`, `Facultad_idFacultad`, `Cuenta_idCuenta`, `Administrador_idAdministrador`, `Alumno_idAlumno`),
  INDEX `fk_Persona_Facultad_idx` (`Facultad_idFacultad` ASC) VISIBLE,
  INDEX `fk_Persona_Cuenta1_idx` (`Cuenta_idCuenta` ASC) VISIBLE,
  INDEX `fk_persona_Administrador1_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  INDEX `fk_persona_Alumno1_idx` (`Alumno_idAlumno` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_Cuenta1`
    FOREIGN KEY (`Cuenta_idCuenta`)
    REFERENCES `facultad`.`Cuenta` (`idCuenta`),
  CONSTRAINT `fk_Persona_Facultad`
    FOREIGN KEY (`Facultad_idFacultad`)
    REFERENCES `facultad`.`Facultad` (`idFacultad`),
  CONSTRAINT `fk_persona_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `facultad`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `facultad`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `facultad`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`Materia` (
  `idMateria` INT NOT NULL,
  `nota` DOUBLE NOT NULL,
  `carrera_idCarrera` INT NOT NULL,
  `carrera_Facultad_idFacultad` INT NOT NULL,
  `EstadoCurricular_idEstadoCurricular` INT NOT NULL,
  PRIMARY KEY (`idMateria`, `carrera_idCarrera`, `carrera_Facultad_idFacultad`, `EstadoCurricular_idEstadoCurricular`),
  INDEX `fk_Materia_carrera1_idx` (`carrera_idCarrera` ASC, `carrera_Facultad_idFacultad` ASC) VISIBLE,
  INDEX `fk_Materia_EstadoCurricular1_idx` (`EstadoCurricular_idEstadoCurricular` ASC) VISIBLE,
  CONSTRAINT `fk_Materia_carrera1`
    FOREIGN KEY (`carrera_idCarrera` , `carrera_Facultad_idFacultad`)
    REFERENCES `facultad`.`Carrera` (`idCarrera` , `Facultad_idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_EstadoCurricular1`
    FOREIGN KEY (`EstadoCurricular_idEstadoCurricular`)
    REFERENCES `facultad`.`EstadoCurricular` (`idEstadoCurricular`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facultad`.`InscripcionCarrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`InscripcionCarrera` (
  `idInscripcionCarrera` INT NOT NULL,
  `Alumno_idAlumno` INT NOT NULL,
  `carrera_idCarrera` INT NOT NULL,
  `carrera_Facultad_idFacultad` INT NOT NULL,
  PRIMARY KEY (`idInscripcionCarrera`, `Alumno_idAlumno`, `carrera_idCarrera`, `carrera_Facultad_idFacultad`),
  INDEX `fk_InscripcionCarrera_Alumno1_idx` (`Alumno_idAlumno` ASC) VISIBLE,
  INDEX `fk_InscripcionCarrera_carrera1_idx` (`carrera_idCarrera` ASC, `carrera_Facultad_idFacultad` ASC) VISIBLE,
  CONSTRAINT `fk_InscripcionCarrera_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `facultad`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InscripcionCarrera_carrera1`
    FOREIGN KEY (`carrera_idCarrera` , `carrera_Facultad_idFacultad`)
    REFERENCES `facultad`.`Carrera` (`idCarrera` , `Facultad_idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facultad`.`InscripcionMateria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facultad`.`InscripcionMateria` (
  `idInscripcionMateria` INT NOT NULL,
  `Alumno_idAlumno` INT NOT NULL,
  `Materia_idMateria` INT NOT NULL,
  `Materia_carrera_idCarrera` INT NOT NULL,
  `Materia_carrera_Facultad_idFacultad` INT NOT NULL,
  PRIMARY KEY (`idInscripcionMateria`, `Alumno_idAlumno`, `Materia_idMateria`, `Materia_carrera_idCarrera`, `Materia_carrera_Facultad_idFacultad`),
  INDEX `fk_InscripcionMateria_Alumno1_idx` (`Alumno_idAlumno` ASC) VISIBLE,
  INDEX `fk_InscripcionMateria_Materia1_idx` (`Materia_idMateria` ASC, `Materia_carrera_idCarrera` ASC, `Materia_carrera_Facultad_idFacultad` ASC) VISIBLE,
  CONSTRAINT `fk_InscripcionMateria_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `facultad`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InscripcionMateria_Materia1`
    FOREIGN KEY (`Materia_idMateria` , `Materia_carrera_idCarrera` , `Materia_carrera_Facultad_idFacultad`)
    REFERENCES `facultad`.`Materia` (`idMateria` , `carrera_idCarrera` , `carrera_Facultad_idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
