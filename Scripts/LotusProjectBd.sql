-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Schema LotusProject
 CREATE USER IF NOT EXISTS 'LotusProject'@'localhost' IDENTIFIED BY '1311138C72A04BB7D228AFB9D574ED2D00DFD264C67161A958AD62E32672DEFF';
 GRANT ALL PRIVILEGES ON * . * TO 'LotusProject'@'localhost';
 FLUSH PRIVILEGES;
 DROP USER IF EXISTS LotusProyect@localhost;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema LotusProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS LotusProject DEFAULT CHARACTER SET utf8 ;
USE LotusProject ;

-- -----------------------------------------------------
-- LotusProject tabla armado
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
-- LotusProject tabla partes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.partes (
 prtId INT(11) NOT NULL AUTO_INCREMENT,
 PrtNombre VARCHAR(45) NULL DEFAULT NULL UNIQUE,
 PrtDescripcion MEDIUMTEXT NULL DEFAULT NULL,
 PRIMARY KEY (prtId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla maestro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.maestro (
 MaeId INT(11) NOT NULL AUTO_INCREMENT,
 MaeNombre VARCHAR(45) NOT NULL,
 MaeDescripcion MEDIUMTEXT NULL DEFAULT NULL,
 PRIMARY KEY (MaeId),
 UNIQUE INDEX MaeNombre (MaeNombre ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.producto (
 ProId INT(11) NOT NULL AUTO_INCREMENT,
 ProNombre VARCHAR(45) NOT NULL,
 ProImagen varchar(255)NOT NULL DEFAULT '0',
 ProEstado TINYINT(1) NOT NULL DEFAULT '0',
 MaeId INT(11) NOT NULL,
 PRIMARY KEY (ProId, MaeId),
 UNIQUE INDEX ProNombre (ProNombre ASC),
 INDEX fk_producto_maestro1_idx (MaeId ASC),
 CONSTRAINT fk_producto_maestro1
  FOREIGN KEY (MaeId)
  REFERENCES LotusProject.maestro (MaeId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla asignaparte
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignaparte (
 AsPrtID INT(11) NOT NULL AUTO_INCREMENT,
 PrtId INT(11) NOT NULL,
 ProId INT(11) NOT NULL,
 PRIMARY KEY (AsPrtID, PrtId, ProId),
 INDEX fk_Partes_has_producto_producto1_idx (ProId ASC),
 INDEX fk_Partes_has_producto_Partes1_idx (PrtId ASC),
 CONSTRAINT fk_Partes_has_producto_Partes1
  FOREIGN KEY (PrtId)
  REFERENCES LotusProject.partes (prtId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
 CONSTRAINT fk_Partes_has_producto_producto1
  FOREIGN KEY (ProId)
  REFERENCES LotusProject.producto (ProId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla fitosanidad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.fitosanidad (
 FitId INT(11) NOT NULL AUTO_INCREMENT,
 FitNombre VARCHAR(45) NOT NULL,
 FitDescripcion MEDIUMTEXT NOT NULL,
 FitTipo ENUM('Plaga', 'Enfermedad') NULL DEFAULT NULL,
 FitImagen varchar(255)NULL DEFAULT NULL,
 FitEstado TINYINT(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (FitId),
 UNIQUE INDEX FitNombre (FitNombre ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla asignafito
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignafito (
 asignaParte_AsPrtID INT(11) NOT NULL,
 fitosanidad_FitId INT(11) NOT NULL,
 AsfImagen varchar(255)NULL DEFAULT NULL,
 AsfDescripcion MEDIUMTEXT NULL DEFAULT NULL,
 PRIMARY KEY (asignaParte_AsPrtID, fitosanidad_FitId),
 INDEX fk_asignaParte_has_fitosanidad_fitosanidad1_idx (fitosanidad_FitId ASC),
 INDEX fk_asignaParte_has_fitosanidad_asignaParte1_idx (asignaParte_AsPrtID ASC),
 CONSTRAINT fk_asignaParte_has_fitosanidad_asignaParte1
  FOREIGN KEY (asignaParte_AsPrtID)
  REFERENCES LotusProject.asignaparte (AsPrtID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
 CONSTRAINT fk_asignaParte_has_fitosanidad_fitosanidad1
  FOREIGN KEY (fitosanidad_FitId)
  REFERENCES LotusProject.fitosanidad (FitId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla rol
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.rol (
 RolId INT(11) NOT NULL AUTO_INCREMENT,
 RolNombre VARCHAR(45) NOT NULL,
 RolDescripcion MEDIUMTEXT NOT NULL,
 RolEstado TINYINT(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (RolId),
 UNIQUE INDEX RolNombre (RolNombre ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.usuario (
 UsuCedula VARCHAR(10) NOT NULL,
 UsuNombre VARCHAR(45) NOT NULL,
 UsuApellido VARCHAR(45) NOT NULL,
 UsuLoger VARCHAR(15) NOT NULL,
 UsuPassword VARCHAR(255) NOT NULL,
 UsuExtencion VARCHAR(4) NOT NULL,
 UsuTelefono VARCHAR(10) NULL DEFAULT NULL,
 UsuEmail VARCHAR(60) NOT NULL,
 UsuGenero VARCHAR(45) NOT NULL,
 UsuAvatar VARCHAR(60) NOT NULL,
 UsuEstado TINYINT(1) NOT NULL DEFAULT '0',
 RolId INT(11) NOT NULL,
 PRIMARY KEY (UsuCedula, RolId),
 UNIQUE INDEX UsuLoger (UsuLoger ASC),
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
-- LotusProject tabla cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.cliente (
 CliId INT NOT NULL Auto_increment,
 CliNombre VARCHAR(45) NOT NULL,
 UsuCedula VARCHAR(10) NOT NULL,
 CliLocalizacion VARCHAR(45) NOT NULL,
 CliLogo VARCHAR(255) NULL,
 CliEstado TINYINT NOT NULL,
 PRIMARY KEY (CliId),
 UNIQUE INDEX CliNombre_UNIQUE (CliNombre ASC),
 INDEX fk_Cliente_usuario1_idx (UsuCedula ASC),
 CONSTRAINT fk_Cliente_usuario1
  FOREIGN KEY (UsuCedula)
  REFERENCES LotusProject.usuario (UsuCedula)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- LotusProject tabla marcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.marcacion (
 MarId INT(11) NOT NULL AUTO_INCREMENT,
 MarNombre VARCHAR(45) NOT NULL,
 MarPortada MEDIUMTEXT NULL DEFAULT NULL,
 MarEstado TINYINT(1) NOT NULL DEFAULT '0',
 ArmId INT(11) NOT NULL,
 CliId INT NOT NULL,
 PRIMARY KEY (MarId, ArmId, CliId),
 UNIQUE INDEX MarNombre (MarNombre ASC),
 INDEX fk_marcacion_Armado1 (ArmId ASC),
 INDEX fk_marcacion_cliente1_idx (CliId ASC),
 CONSTRAINT fk_marcacion_Armado1
  FOREIGN KEY (ArmId)
  REFERENCES LotusProject.armado (ArmId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
 CONSTRAINT fk_marcacion_cliente1
  FOREIGN KEY (CliId)
  REFERENCES LotusProject.cliente (CliId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla poscosecha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.poscosecha (
 PosId INT(11) NOT NULL AUTO_INCREMENT,
 PosNombre VARCHAR(45) NOT NULL,
 PosDireccion VARCHAR(90) NOT NULL,
 PosTelefono VARCHAR(10) NOT NULL,
 PosEstado TINYINT(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (PosId),
 UNIQUE INDEX PosNombre (PosNombre ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla preliminar
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
-- LotusProject tabla asignamarcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignamarcacion (
 PreId INT(11) NOT NULL,
 MarId INT(11) NOT NULL,
 NoRamos INT(11) NULL DEFAULT NULL,
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
-- LotusProject tabla tipoms
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.tipoms (
 TiMId INT(11) NOT NULL AUTO_INCREMENT,
 TiMNombre VARCHAR(45) NOT NULL,
 TiMDescripcion MEDIUMTEXT NULL DEFAULT NULL,
 PRIMARY KEY (TiMId),
 UNIQUE INDEX TiMNombre (TiMNombre ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla materialseco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.materialseco (
 MsId INT(11) NOT NULL AUTO_INCREMENT,
 TiMId INT(11) NOT NULL,
 MsNombre VARCHAR(45) NOT NULL,
 MsImagen MEDIUMTEXT NULL DEFAULT NULL,
 MsDescripcion MEDIUMTEXT NOT NULL,
 MsEstado TINYINT(1) NOT NULL DEFAULT '0',
 MsAlto INT(3) NULL,
 MsAncho INT(3) NULL,
 MsProfundo INT(3) NULL,
 PRIMARY KEY (MsId),
 UNIQUE INDEX MsNombre (MsNombre ASC),
 INDEX fk_MaterialSeco_TipoMs1 (TiMId ASC),
 CONSTRAINT fk_MaterialSeco_TipoMs1
  FOREIGN KEY (TiMId)
  REFERENCES LotusProject.tipoms (TiMId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla menu
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
-- LotusProject tabla asignamatseco
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
-- LotusProject tabla grados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.grados (
 GraID INT(11) NOT NULL AUTO_INCREMENT,
 GraNombre VARCHAR(45) NOT NULL,
 GraDetalles MEDIUMTEXT NULL DEFAULT NULL,
 GraEstado TINYINT(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (GraID),
 UNIQUE INDEX GraNombre (GraNombre ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla parametros
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.parametros (
 ParId INT(11) NOT NULL AUTO_INCREMENT,
 ParNombre VARCHAR(45) NOT NULL,
 ParEstado TINYINT(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (ParId),
 UNIQUE INDEX ParNombre (ParNombre ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla variedad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.variedad (
 VarId INT(11) NOT NULL AUTO_INCREMENT,
 VarNombre VARCHAR(45) NOT NULL,
 VarEstado TINYINT(1) NOT NULL DEFAULT '0',
 ProId INT(11) NOT NULL,
 VarImagen varchar(255)NULL DEFAULT NULL,
 VarColor VARCHAR(15) NULL DEFAULT NULL,
 PRIMARY KEY (VarId, ProId),
 UNIQUE INDEX VarNombre (VarNombre ASC),
 INDEX fk_Variedad_producto1 (ProId ASC),
 CONSTRAINT fk_Variedad_producto1
  FOREIGN KEY (ProId)
  REFERENCES LotusProject.producto (ProId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla asignaparametro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignaparametro (
 GraID INT(11) NULL DEFAULT NULL,
 ParId INT(11) NOT NULL,
 MaeId INT(11) NOT NULL,
 ProId INT(11) NULL DEFAULT NULL,
 VarId INT(11) NULL DEFAULT NULL,
 PaProDescripcion MEDIUMTEXT NULL DEFAULT NULL,
 PaProFoto VARCHAR(45) NULL DEFAULT NULL,
  FOREIGN KEY (MaeId) REFERENCES LotusProject.maestro (MaeId) 
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (GraID) REFERENCES LotusProject.grados (GraID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (ParId) REFERENCES LotusProject.parametros (ParId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (ProId) REFERENCES LotusProject.producto (ProId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (VarId) REFERENCES LotusProject.variedad (VarId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla permiso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.permiso (
 PerId INT(11) NOT NULL AUTO_INCREMENT,
 PerNombre VARCHAR(45) NOT NULL,
 PerModulo VARCHAR(45) NOT NULL,
 PerDescripcion MEDIUMTEXT NOT NULL,
 PerIco VARCHAR(20) NOT NULL,
 PerUrl VARCHAR(100) NOT NULL,
 PerEstado TINYINT(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (PerId),
 UNIQUE INDEX PerNombre (PerNombre ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla asignapermiso
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
-- LotusProject tabla asignaposcosecha
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
-- LotusProject tabla controldecambios
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
-- LotusProject tabla linea
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
-- LotusProject tabla paso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.paso (
 PasId INT(11) NOT NULL AUTO_INCREMENT,
 PasOrden INT(11) NOT NULL,
 PasDescripcion MEDIUMTEXT NOT NULL,
 PasImagen varchar(255)NOT NULL,
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
-- LotusProject tabla notas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.notas (
 NotId INT NOT NULL,
 NotTipo VARCHAR(45) NOT NULL,
 NotDetalles MEDIUMTEXT NULL,
 CliId INT NOT NULL,
 PRIMARY KEY (NotId, CliId),
 UNIQUE INDEX NotId_UNIQUE (NotId ASC),
 INDEX fk_Notas_cliente1_idx (CliId ASC),
 CONSTRAINT fk_Notas_cliente1
  FOREIGN KEY (CliId)
  REFERENCES LotusProject.cliente (CliId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- LotusProject tabla asignanota
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignanota (
 NotId INT NOT NULL,
 VarId INT(11) NOT NULL,
 ProId INT(11) NOT NULL,
 INDEX fk_Notas_has_variedad_variedad1_idx (VarId ASC, ProId ASC),
 INDEX fk_Notas_has_variedad_Notas1_idx (NotId ASC),
 CONSTRAINT fk_Notas_has_variedad_Notas1
  FOREIGN KEY (NotId)
  REFERENCES LotusProject.notas (NotId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
 CONSTRAINT fk_Notas_has_variedad_variedad1
  FOREIGN KEY (VarId , ProId)
  REFERENCES LotusProject.variedad (VarId , ProId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- LotusProject tabla asignaproducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignaproducto (
 PosId INT(11) NOT NULL,
 ProId INT(11) NOT NULL,
 PRIMARY KEY (PosId, ProId),
 INDEX fk_poscosecha_has_producto_producto1_idx (ProId ASC),
 INDEX fk_poscosecha_has_producto_poscosecha1_idx (PosId ASC),
 CONSTRAINT fk_poscosecha_has_producto_poscosecha1
  FOREIGN KEY (PosId)
  REFERENCES LotusProject.poscosecha (PosId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
 CONSTRAINT fk_poscosecha_has_producto_producto1
  FOREIGN KEY (ProId)
  REFERENCES LotusProject.producto (ProId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- LotusProject tabla asignasurtido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProject.asignasurtido (
 MenuId INT(11) NOT NULL,
 ProId INT(11) NOT NULL,
 GraID INT(11) NOT NULL,
 Tallos INT(11) NOT NULL,
 Color VARCHAR(45) NULL,
 PRIMARY KEY (MenuId, GraID),
 INDEX fk_grados_has_menu_menu1_idx (MenuId ASC),
 INDEX fk_grados_has_menu_grados1_idx (GraID ASC),
 INDEX fk_grados_has_menu_producto1_idx (ProId ASC),
 CONSTRAINT fk_grados_has_menu_grados1
  FOREIGN KEY (GraID)
  REFERENCES LotusProject.grados (GraID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
 CONSTRAINT fk_grados_has_menu_menu1
  FOREIGN KEY (MenuId)
  REFERENCES LotusProject.menu (MenuId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
 CONSTRAINT fk_grados_has_menu_producto1
  FOREIGN KEY (ProId)
  REFERENCES LotusProject.producto (ProId)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
