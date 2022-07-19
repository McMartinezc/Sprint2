
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8mb3 ;

CREATE TABLE IF NOT EXISTS `youtube`.`canal` (
  `idCanal` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL DEFAULT NULL,
  `Descripció` LONGTEXT NULL DEFAULT NULL,
  `Data_creació` DATETIME NULL DEFAULT NULL,
  `usuari_idUsuari` INT(11) NOT NULL,
  PRIMARY KEY (`idCanal`, `usuari_idUsuari`),
  INDEX `fk_canal_usuari1_idx` (`usuari_idUsuari` ASC) VISIBLE,
  CONSTRAINT `fk_canal_usuari1`
    FOREIGN KEY (`usuari_idUsuari`)
    REFERENCES `youtube`.`usuari` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`comentari` (
  `idComentari` INT(11) NOT NULL AUTO_INCREMENT,
  `Text_comentari` VARCHAR(500) NULL DEFAULT NULL,
  `Data_hora` DATETIME NULL DEFAULT NULL COMMENT 'La data/hora en la qual es va realitzar.',
  `usuari_idUsuari` INT(11) NOT NULL,
  `usuari_valoració_idValoració` INT(11) NOT NULL,
  `canal_idCanal` INT(11) NOT NULL,
  `canal_usuari_idUsuari` INT(11) NOT NULL,
  `valoració_idValoració` INT(11) NOT NULL,
  `valoració_video_idVideo` INT(11) NOT NULL,
  PRIMARY KEY (`idComentari`, `usuari_idUsuari`, `usuari_valoració_idValoració`, `canal_idCanal`, `canal_usuari_idUsuari`, `valoració_idValoració`, `valoració_video_idVideo`),
  INDEX `fk_comentari_usuari1_idx` (`usuari_idUsuari` ASC, `usuari_valoració_idValoració` ASC) VISIBLE,
  INDEX `fk_comentari_canal1_idx` (`canal_idCanal` ASC, `canal_usuari_idUsuari` ASC) VISIBLE,
  INDEX `fk_comentari_valoració1_idx` (`valoració_idValoració` ASC, `valoració_video_idVideo` ASC) VISIBLE,
  CONSTRAINT `fk_comentari_usuari1`
    FOREIGN KEY (`usuari_idUsuari` , `usuari_valoració_idValoració`)
    REFERENCES `youtube`.`usuari` (`idUsuari` , `valoració_idValoració`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentari_canal1`
    FOREIGN KEY (`canal_idCanal` , `canal_usuari_idUsuari`)
    REFERENCES `youtube`.`canal` (`idCanal` , `usuari_idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentari_valoració1`
    FOREIGN KEY (`valoració_idValoració` , `valoració_video_idVideo`)
    REFERENCES `youtube`.`valoració` (`idValoració` , `video_idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`etiqueta` (
  `idEtiqueta` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `data_hora` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idEtiqueta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `idplaylist` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Data_creació` DATE NULL DEFAULT NULL,
  `Estat` ENUM('privada', 'publica') NULL DEFAULT NULL COMMENT 'Seleccionar :\\nPRI-->privada\\nP-->pública',
  `usuari_idUsuari` INT(11) NOT NULL,
  PRIMARY KEY (`idplaylist`, `usuari_idUsuari`),
  INDEX `fk_playlist_usuari1_idx` (`usuari_idUsuari` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuari1`
    FOREIGN KEY (`usuari_idUsuari`)
    REFERENCES `youtube`.`usuari` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`usuari` (
  `idUsuari` INT(11) NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Usuari\àriacol` VARCHAR(45) NOT NULL COMMENT 'nom usuari',
  `Password` VARCHAR(80) NOT NULL,
  `Nom` VARCHAR(45) NULL DEFAULT NULL COMMENT 'nom ',
  `Data_naixement` DATE NULL DEFAULT NULL,
  `Sexe` ENUM('H', 'M', 'NB', 'NC') NULL DEFAULT NULL COMMENT 'Seleccionar:\\nD-->dona\\nH-->home\\nno binari-->NB',
  `Pais` VARCHAR(45) NULL DEFAULT NULL,
  `Codi_postal` VARCHAR(45) NULL DEFAULT NULL,
  `valoració_idValoració` INT(11) NOT NULL,
  PRIMARY KEY (`idUsuari`, `valoració_idValoració`),
  INDEX `fk_usuari_valoració1_idx` (`valoració_idValoració` ASC) VISIBLE,
  CONSTRAINT `fk_usuari_valoració1`
    FOREIGN KEY (`valoració_idValoració`)
    REFERENCES `youtube`.`valoració` (`idValoració`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`valoració` (
  `idValoració` INT(11) NOT NULL AUTO_INCREMENT,
  `like` VARCHAR(1) NULL DEFAULT NULL,
  `dislike` VARCHAR(1) NULL DEFAULT NULL,
  `Data_hora` DATETIME NOT NULL,
  `video_idVideo` INT(11) NOT NULL,
  PRIMARY KEY (`idValoració`, `video_idVideo`),
  INDEX `fk_valoració_video1_idx` (`video_idVideo` ASC) VISIBLE,
  CONSTRAINT `fk_valoració_video1`
    FOREIGN KEY (`video_idVideo`)
    REFERENCES `youtube`.`video` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `idVideo` INT(11) NOT NULL AUTO_INCREMENT,
  `Títol` VARCHAR(45) NULL DEFAULT NULL,
  `Grandària` INT(11) NULL DEFAULT NULL,
  `Nom_arxiu` VARCHAR(45) NULL DEFAULT NULL COMMENT 'El nom de l\'arxiu de vídeo',
  `Durada` TIME NULL DEFAULT NULL COMMENT 'Durada del vídeo',
  `Thumbnail` VARCHAR(45) NULL DEFAULT NULL,
  `num_rep` FLOAT(11) NULL DEFAULT NULL COMMENT 'El nombre de reproduccions',
  `num_likes` FLOAT(11) NULL DEFAULT NULL COMMENT 'El número de likes',
  `num_dislikes` FLOAT(11) NULL DEFAULT NULL COMMENT 'El número de dislikes',
  `estat` ENUM('public', 'privat', 'ocult') NULL DEFAULT NULL COMMENT 'Seleccionar:\\nP-->públic\\nPRI-->privat\\nO-->Ocult',
  `usuari_idUsuari` INT(11) NOT NULL,
  PRIMARY KEY (`idVideo`),
  INDEX `fk_video_usuari_idx` (`usuari_idUsuari` ASC) VISIBLE,
  CONSTRAINT `fk_video_usuari`
    FOREIGN KEY (`usuari_idUsuari`)
    REFERENCES `youtube`.`usuari` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`video_etiqueta` (
  `video_idVideo` INT(11) NOT NULL,
  `etiqueta_idEtiqueta` INT(11) NOT NULL,
  PRIMARY KEY (`video_idVideo`, `etiqueta_idEtiqueta`),
  INDEX `fk_video_has_etiqueta_etiqueta1_idx` (`etiqueta_idEtiqueta` ASC) VISIBLE,
  INDEX `fk_video_has_etiqueta_video1_idx` (`video_idVideo` ASC) VISIBLE,
  CONSTRAINT `fk_video_has_etiqueta_video1`
    FOREIGN KEY (`video_idVideo`)
    REFERENCES `youtube`.`video` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_has_etiqueta_etiqueta1`
    FOREIGN KEY (`etiqueta_idEtiqueta`)
    REFERENCES `youtube`.`etiqueta` (`idEtiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`usuari_subcripcio_canal` (
  `usuari_idUsuari` INT(11) NOT NULL,
  `canal_idCanal` INT(11) NOT NULL,
  `canal_usuari_idUsuari` INT(11) NOT NULL,
  PRIMARY KEY (`usuari_idUsuari`, `canal_idCanal`, `canal_usuari_idUsuari`),
  INDEX `fk_usuari_has_canal_canal1_idx` (`canal_idCanal` ASC, `canal_usuari_idUsuari` ASC) VISIBLE,
  INDEX `fk_usuari_has_canal_usuari1_idx` (`usuari_idUsuari` ASC) VISIBLE,
  CONSTRAINT `fk_usuari_has_canal_usuari1`
    FOREIGN KEY (`usuari_idUsuari`)
    REFERENCES `youtube`.`usuari` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_canal_canal1`
    FOREIGN KEY (`canal_idCanal` , `canal_usuari_idUsuari`)
    REFERENCES `youtube`.`canal` (`idCanal` , `usuari_idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;