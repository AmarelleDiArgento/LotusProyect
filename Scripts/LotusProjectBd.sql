-- -----------------------------------------------------
-- Schema LotusProject
 CREATE USER IF NOT EXISTS 'LotusProject'@'localhost' IDENTIFIED BY '1311138C72A04BB7D228AFB9D574ED2D00DFD264C67161A958AD62E32672DEFF';
 GRANT ALL PRIVILEGES ON * . * TO 'LotusProject'@'localhost';
 FLUSH PRIVILEGES;
 DROP USER IF EXISTS LotusProyect@localhost;
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema LotusProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS LotusProject DEFAULT CHARACTER SET utf8 ;
USE LotusProject ;

-- -----------------------------------------------------
-- Table LotusProject armado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.armado (
  ArmId INT(11) NOT NULL AUTO_INCREMENT,
  ArmNombre VARCHAR(45) NULL DEFAULT NULL,
  ArmDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  ArmEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ArmId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject marcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.marcacion (
  MarId INT(11) NOT NULL AUTO_INCREMENT,
  MarNombre VARCHAR(45) NOT NULL UNIQUE,
  MarPortada MEDIUMTEXT NULL DEFAULT NULL,
  MarEstado TINYINT(1) NOT NULL DEFAULT '0',
  ArmId INT(11) NOT NULL,
  PRIMARY KEY (MarId, ArmId),
  INDEX fk_marcacion_Armado1 (ArmId ASC),
  CONSTRAINT fk_marcacion_Armado1
    FOREIGN KEY (ArmId)
    REFERENCES LotusProject.armado (ArmId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject poscosecha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.poscosecha (
  PosId INT(11) NOT NULL AUTO_INCREMENT,
  PosNombre VARCHAR(45) NOT NULL UNIQUE,
  PosDireccion VARCHAR(90) NOT NULL,
  PosTelefono VARCHAR(10) NOT NULL,
  PosEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (PosId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject preliminar
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.preliminar (
  PreId INT(11) NOT NULL AUTO_INCREMENT,
  PreFecha DATETIME NOT NULL,
  PreEstado ENUM('Pendiente', 'En Curso', 'Finalizada') NOT NULL DEFAULT 'Pendiente',
  PosId INT(11) NOT NULL,
  PRIMARY KEY (PreId, PosId),
  INDEX fk_preliminar_poscosecha1_idx (PosId ASC),
  CONSTRAINT fk_preliminar_poscosecha1
    FOREIGN KEY (PosId)
    REFERENCES LotusProject.poscosecha (PosId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject asignamarcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignamarcacion (
  PreId INT(11) NOT NULL,
  MarId INT(11) NOT NULL,
  NoRamos INT NULL,
  PRIMARY KEY (PreId, MarId),
  INDEX fk_Preliminar_has_Marcacion_Marcacion1 (MarId ASC),
  CONSTRAINT fk_Preliminar_has_Marcacion_Marcacion1
    FOREIGN KEY (MarId)
    REFERENCES LotusProject.marcacion (MarId),
  CONSTRAINT fk_Preliminar_has_Marcacion_Preliminar1
    FOREIGN KEY (PreId)
    REFERENCES LotusProject.preliminar (PreId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject tipoms
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.tipoms (
  TiMId INT(11) NOT NULL AUTO_INCREMENT,
  TiMNombre VARCHAR(45) NOT NULL UNIQUE,
  TiMDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (TiMId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject materialseco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.materialseco (
  MsId INT(11) NOT NULL AUTO_INCREMENT,
  TiMId INT(11) NOT NULL,
  MsNombre VARCHAR(45) NOT NULL UNIQUE,
  MsImagen MEDIUMTEXT NULL DEFAULT NULL,
  MsDescripcion MEDIUMTEXT NOT NULL,
  MsEstado TINYINT(1) NOT NULL DEFAULT '0',
  MsAlto INT(3) NOT NULL,
  MsAncho INT(3) NOT NULL,
  MsProfundo INT(3) NOT NULL,
  PRIMARY KEY (MsId),
  INDEX fk_MaterialSeco_TipoMs1 (TiMId ASC),
  CONSTRAINT fk_MaterialSeco_TipoMs1
    FOREIGN KEY (TiMId)
    REFERENCES LotusProject.tipoms (TiMId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.menu (
  MenuId INT(11) NOT NULL AUTO_INCREMENT,
  MenuOrden VARCHAR(45) NOT NULL,
  Marcacion_MarId INT(11) NOT NULL,
  MenPortada MEDIUMTEXT NULL DEFAULT NULL,
  MenSuperior MEDIUMTEXT NULL DEFAULT NULL,
  MenLongitud MEDIUMTEXT NULL DEFAULT NULL,
  MenCauchos MEDIUMTEXT NULL DEFAULT NULL,
  MenEstado TINYINT(1) NULL DEFAULT '0',
  MenDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (MenuId, Marcacion_MarId),
  INDEX fk_Menu_Marcacion1 (Marcacion_MarId ASC),
  CONSTRAINT fk_Menu_Marcacion1
    FOREIGN KEY (Marcacion_MarId)
    REFERENCES LotusProject.marcacion (MarId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject asignamatseco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignamatseco (
  MsId INT(11) NOT NULL AUTO_INCREMENT,
  MenuId INT(11) NOT NULL,
  MsMenUbicacion VARCHAR(100) NULL DEFAULT NULL,
  MsMenImagen MEDIUMTEXT NULL DEFAULT NULL,
  MsMenCantidad INT(2) NULL DEFAULT NULL,
  PRIMARY KEY (MsId, MenuId),
  INDEX fk_MaterialSeco_has_Menu_Menu1 (MenuId ASC),
  CONSTRAINT fk_MaterialSeco_has_Menu_MaterialSeco1
    FOREIGN KEY (MsId)
    REFERENCES LotusProject.materialseco (MsId),
  CONSTRAINT fk_MaterialSeco_has_Menu_Menu1
    FOREIGN KEY (MenuId)
    REFERENCES LotusProject.menu (MenuId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject grados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.grados (
  GraID INT(11) NOT NULL AUTO_INCREMENT,
  GraNombre VARCHAR(45) NOT NULL UNIQUE,
  GraDetalles MEDIUMTEXT NULL DEFAULT NULL,
  GraEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (GraID))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject parametros
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.parametros (
  ParId INT(11) NOT NULL AUTO_INCREMENT,
  ParNombre VARCHAR(45) NOT NULL UNIQUE,
  ParEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ParId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject maestro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.maestro (
  MaeId INT(11) NOT NULL AUTO_INCREMENT,
  MaeNombre VARCHAR(45) NOT NULL UNIQUE,
  MaeDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (MaeId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.producto (
  ProId INT(11) NOT NULL AUTO_INCREMENT,
  ProNombre VARCHAR(45) NOT NULL UNIQUE,
  ProImagen VARCHAR(45) NOT NULL DEFAULT '0',
  ProEstado TINYINT(1) NOT NULL DEFAULT '0',
  MaeId INT(11) NOT NULL,
  PRIMARY KEY (ProId, MaeId),
  INDEX fk_producto_maestro1_idx (MaeId ASC),
  CONSTRAINT fk_producto_maestro1
    FOREIGN KEY (MaeId)
    REFERENCES LotusProject.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject variedad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.variedad (
  VarId INT(11) NOT NULL AUTO_INCREMENT,
  VarNombre VARCHAR(45) NOT NULL UNIQUE,
  VarEstado TINYINT(1) NOT NULL DEFAULT '0',
  ProId INT(11) NOT NULL,
  VarImagen VARCHAR(45) NULL DEFAULT NULL,
  VarColor VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (VarId, ProId),
  INDEX fk_Variedad_producto1 (ProId ASC),
  CONSTRAINT fk_Variedad_producto1
    FOREIGN KEY (ProId)
    REFERENCES LotusProject.producto (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject asignaparametro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignaparametro (
  GraID INT(11) NOT NULL,
  ParId INT(11) NOT NULL,
  MaeId INT(11) NOT NULL,
  ProId INT(11) NULL DEFAULT NULL,
  VarId INT(11) NULL DEFAULT NULL,
  PaProDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PaProFoto VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (GraID, ParId, MaeId),
  INDEX fk_grados_has_parametros_parametros1 (ParId ASC),
  INDEX fk_parproducto_variedad1_idx (VarId ASC),
  INDEX fk_parproducto_producto1_idx (ProId ASC),
  INDEX fk_asignaparametro_maestro1_idx (MaeId ASC),
  CONSTRAINT fk_grados_has_parametros_grados1
    FOREIGN KEY (GraID)
    REFERENCES LotusProject.grados (GraID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_grados_has_parametros_parametros1
    FOREIGN KEY (ParId)
    REFERENCES LotusProject.parametros (ParId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_parproducto_producto1
    FOREIGN KEY (ProId)
    REFERENCES LotusProject.producto (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_parproducto_variedad1
    FOREIGN KEY (VarId)
    REFERENCES LotusProject.variedad (VarId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_asignaparametro_maestro1
    FOREIGN KEY (MaeId)
    REFERENCES LotusProject.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject permiso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.permiso (
  PerId INT(11) NOT NULL AUTO_INCREMENT,
  PerNombre VARCHAR(45) NOT NULL UNIQUE,
  PerModulo VARCHAR(45) NOT NULL,
  PerDescripcion MEDIUMTEXT NOT NULL,
  PerIco VARCHAR(20) NOT NULL,
  PerUrl VARCHAR(100) NOT NULL,
  PerEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (PerId))
ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject rol
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.rol (
  RolId INT(11) NOT NULL AUTO_INCREMENT,
  RolNombre VARCHAR(45) NOT NULL UNIQUE,
  RolDescripcion MEDIUMTEXT NOT NULL,
  RolEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (RolId))
ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject asignapermiso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignapermiso (
  RolId INT(11) NOT NULL,
  PerId INT(11) NOT NULL,
  rolperLeer TINYINT(1) NOT NULL DEFAULT '0',
  rolperNuevo TINYINT(1) NOT NULL DEFAULT '0',
  rolperEditar TINYINT(1) NOT NULL DEFAULT '0',
  rolperEliminar TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (RolId, PerId),
  INDEX fk_Rol_has_Permiso_Permiso1 (PerId ASC),
  CONSTRAINT fk_Rol_has_Permiso_Permiso1
    FOREIGN KEY (PerId)
    REFERENCES LotusProject.permiso (PerId),
  CONSTRAINT fk_Rol_has_Permiso_Rol1
    FOREIGN KEY (RolId)
    REFERENCES LotusProject.rol (RolId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.usuario (
  UsuCedula VARCHAR(10) NOT NULL,
  UsuNombre VARCHAR(45) NOT NULL,
  UsuApellido VARCHAR(45) NOT NULL,
  UsuLoger VARCHAR(15) NOT NULL UNIQUE,
  UsuPassword VARCHAR(255) NOT NULL,
  UsuExtencion VARCHAR(4) NOT NULL,
  UsuTelefono VARCHAR(10) NULL DEFAULT NULL,
  UsuEmail VARCHAR(60) NOT NULL,
  UsuGenero VARCHAR(1) NOT NULL,
  UsuAvatar VARCHAR(60) NOT NULL,
  UsuEstado TINYINT(1) NOT NULL DEFAULT '0',
  RolId INT(11) NOT NULL,
  PRIMARY KEY (UsuCedula, RolId),
  UNIQUE INDEX UsuId_UNIQUE (UsuCedula ASC),
  INDEX fk_usuario_rol1_idx (RolId ASC),
  CONSTRAINT fk_usuario_rol1
    FOREIGN KEY (RolId)
    REFERENCES LotusProject.rol (RolId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject asignaposcosecha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignaposcosecha (
  PosId INT(11) NOT NULL AUTO_INCREMENT,
  UsuCedula VARCHAR(10) NOT NULL,
  PRIMARY KEY (PosId, UsuCedula),
  INDEX fk_poscosecha_has_usuario_usuario1_idx (UsuCedula ASC),
  INDEX fk_poscosecha_has_usuario_poscosecha1_idx (PosId ASC),
  CONSTRAINT fk_poscosecha_has_usuario_poscosecha1
    FOREIGN KEY (PosId)
    REFERENCES LotusProject.poscosecha (PosId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_poscosecha_has_usuario_usuario1
    FOREIGN KEY (UsuCedula)
    REFERENCES LotusProject.usuario (UsuCedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject asignaproducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignaproducto (
  ProId INT(11) NOT NULL,
  MenuId INT(11) NOT NULL,
  Tallos INT(11) NULL DEFAULT NULL,
  Color VARCHAR(45) NULL,
  PRIMARY KEY (ProId, MenuId),
  INDEX fk_producto_has_menu_menu1 (MenuId ASC),
  CONSTRAINT fk_producto_has_menu_menu1
    FOREIGN KEY (MenuId)
    REFERENCES LotusProject.menu (MenuId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_producto_has_menu_producto1
    FOREIGN KEY (ProId)
    REFERENCES LotusProject.producto (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject controldecambios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.controldecambios (
  CCId INT(11) NOT NULL AUTO_INCREMENT,
  CCAntes MEDIUMTEXT NOT NULL,
  CCDespues MEDIUMTEXT NOT NULL,
  CCUsuarios VARCHAR(10) NOT NULL,
  PRIMARY KEY (CCId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject fitosanidad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.fitosanidad (
  FitId INT(11) NOT NULL AUTO_INCREMENT,
  FitNombre VARCHAR(45) NOT NULL UNIQUE,
  FitDescripcion MEDIUMTEXT NOT NULL,
  FitTipo ENUM('Plaga', 'Enfermedad') NULL DEFAULT NULL,
  FitImagen VARCHAR(45) NULL DEFAULT NULL,
  FitEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (FitId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject linea
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.linea (
  LinId INT(11) NOT NULL AUTO_INCREMENT,
  LinEstado TINYINT(1) NOT NULL DEFAULT '0',
  PosId INT(11) NOT NULL,
  PRIMARY KEY (LinId, PosId),
  INDEX fk_linea_poscosecha1_idx (PosId ASC),
  CONSTRAINT fk_linea_poscosecha1
    FOREIGN KEY (PosId)
    REFERENCES LotusProject.poscosecha (PosId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject paso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.paso (
  PasId INT(11) NOT NULL AUTO_INCREMENT,
  PasOrden INT(11) NOT NULL,
  PasDescripcion MEDIUMTEXT NOT NULL,
  PasImagen VARCHAR(255) NOT NULL,
  ArmId INT(11) NOT NULL,
  PRIMARY KEY (PasId, ArmId),
  INDEX fk_paso_armado1_idx (ArmId ASC),
  CONSTRAINT fk_paso_armado1
    FOREIGN KEY (ArmId)
    REFERENCES LotusProject.armado (ArmId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProject partes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.partes (
  prtId INT AUTO_INCREMENT NOT NULL,
  PrtNombre VARCHAR(45) NULL,
  PrtDescripcion MEDIUMTEXT NULL,
  PRIMARY KEY (prtId))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table LotusProject asignaparte
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignaparte (
  AsPrtID INT NOT NULL AUTO_INCREMENT,
  PrtId INT NOT NULL,
  ProId INT(11) NOT NULL,
  PRIMARY KEY (AsPrtID, PrtId, ProId),
  INDEX fk_partes_has_producto_producto1_idx (ProId ASC),
  INDEX fk_partes_has_producto_partes1_idx (PrtId ASC),
  CONSTRAINT fk_partes_has_producto_partes1
    FOREIGN KEY (PrtId)
    REFERENCES LotusProject.partes (prtId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_partes_has_producto_producto1
    FOREIGN KEY (ProId)
    REFERENCES LotusProject.producto (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table LotusProject asignafito
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignafito (
  AsPrtID INT NOT NULL,
  FitId INT(11) NOT NULL,
  AsfImagen VARCHAR(45) NULL,
  AsfDescripcion MEDIUMTEXT NULL,
  PRIMARY KEY (AsPrtID, FitId),
  INDEX fk_asignaParte_has_fitosanidad_fitosanidad1_idx (FitId ASC),
  INDEX fk_asignaParte_has_fitosanidad_asignaParte1_idx (AsPrtID ASC),
  CONSTRAINT fk_asignaParte_has_fitosanidad_asignaParte1
    FOREIGN KEY (AsPrtID)
    REFERENCES LotusProject.asignaparte (AsPrtID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_asignaParte_has_fitosanidad_fitosanidad1
    FOREIGN KEY (FitId)
    REFERENCES LotusProject.fitosanidad (FitId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
