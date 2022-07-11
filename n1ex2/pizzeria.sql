use optica

CREATE TABLE IF NOT EXISTS `mydb`.`Categoria_Pizza` (
  `idPizza` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `producte_id_producte` INT NOT NULL,
  `producte_Categoria_Pizza_idPizza` INT NOT NULL,
  PRIMARY KEY (`idPizza`, `producte_id_producte`, `producte_Categoria_Pizza_idPizza`),
  INDEX `fk_Categoria_Pizza_producte1_idx` (`producte_id_producte` ASC, `producte_Categoria_Pizza_idPizza` ASC) VISIBLE,
  CONSTRAINT `fk_Categoria_Pizza_producte1`
    FOREIGN KEY (`producte_id_producte` , `producte_Categoria_Pizza_idPizza`)
    REFERENCES `pizzeria`.`producte` (`id_producte` , `Categoria_Pizza_idPizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDBbotigacategoria_pizza
