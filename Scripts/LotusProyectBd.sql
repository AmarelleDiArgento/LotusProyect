-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lotusproyect
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lotusproyect
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS lotusproyect DEFAULT CHARACTER SET utf8 ;
USE lotusproyect ;

-- -----------------------------------------------------
-- Table lotusproyect.armado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.armado (
  ArmId INT(11) NOT NULL,
  ArmNombre VARCHAR(45) NULL DEFAULT NULL,
  ArmDescricion VARCHAR(45) NULL DEFAULT NULL,
  ArmEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ArmId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.controldecambios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.controldecambios (
  CCId INT(11) NOT NULL,
  CCAntes MEDIUMTEXT NOT NULL,
  CCDespues MEDIUMTEXT NOT NULL,
  CCUsuarios VARCHAR(10) NOT NULL,
  PRIMARY KEY (CCId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.maestro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.maestro (
  MaeId INT(11) NOT NULL AUTO_INCREMENT,
  MaeNombre VARCHAR(45) NOT NULL,
  MaeDescripcion VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (MaeId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.productos (
  ProId INT(11) NOT NULL,
  ProNombre VARCHAR(45) NOT NULL,
  ProEstado TINYINT(1) NOT NULL DEFAULT '0',
  maestro_MaeId INT(11) NOT NULL,
  PRIMARY KEY (ProId, maestro_MaeId),
  INDEX fk_productos_maestro1_idx (maestro_MaeId ASC),
  CONSTRAINT fk_productos_maestro1
    FOREIGN KEY (maestro_MaeId)
    REFERENCES lotusproyect.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.variedad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.variedad (
  VarId INT(11) NOT NULL,
  VarNombre VARCHAR(45) NOT NULL,
  VarEstado TINYINT(1) NOT NULL DEFAULT '0',
  productos_ProId INT(11) NOT NULL,
  VarImagen VARCHAR(45) NULL DEFAULT NULL,
  VarColor VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (VarId, productos_ProId),
  INDEX fk_Variedad_productos1 (productos_ProId ASC),
  CONSTRAINT fk_Variedad_productos1
    FOREIGN KEY (productos_ProId)
    REFERENCES lotusproyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.fitosanidad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.fitosanidad (
  FitId INT(11) NOT NULL,
  FitNombre VARCHAR(45) NOT NULL,
  FitDescripcion VARCHAR(45) NOT NULL,
  FitTipo ENUM('Plaga', 'Enfermedad') NULL DEFAULT NULL,
  FitImagen VARCHAR(45) NULL DEFAULT NULL,
  FitEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (FitId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.fitoproducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.fitoproducto (
  Fitosanidad_FitId INT(11) NOT NULL,
  maestro_MaeId INT(11) NULL DEFAULT NULL,
  productos_ProId INT(11) NULL DEFAULT NULL,
  variedad_VarId INT(11) NULL DEFAULT NULL,
  FpArea VARCHAR(45) NOT NULL,
  FpImagen VARCHAR(45) NOT NULL,
  PRIMARY KEY (Fitosanidad_FitId),
  INDEX fk_fitoproducto_maestro1_idx (maestro_MaeId ASC),
  INDEX fk_fitoproducto_productos1_idx (productos_ProId ASC),
  INDEX fk_fitoproducto_variedad1_idx (variedad_VarId ASC),
  CONSTRAINT fk_fitoproducto_maestro1
    FOREIGN KEY (maestro_MaeId)
    REFERENCES lotusproyect.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fitoproducto_productos1
    FOREIGN KEY (productos_ProId)
    REFERENCES lotusproyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fitoproducto_variedad1
    FOREIGN KEY (variedad_VarId)
    REFERENCES lotusproyect.variedad (VarId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_productos_has_Fitosanidad_Fitosanidad1
    FOREIGN KEY (Fitosanidad_FitId)
    REFERENCES lotusproyect.fitosanidad (FitId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.grados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.grados (
  GraID INT(11) NOT NULL,
  GraNombre VARCHAR(45) NOT NULL,
  GraDetalles MEDIUMTEXT NULL DEFAULT NULL,
  GraEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (GraID))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.poscosecha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.poscosecha (
  PosId INT(11) NOT NULL AUTO_INCREMENT,
  PosNombre VARCHAR(45) NOT NULL,
  PosDireccion VARCHAR(90) NOT NULL,
  PosTelefono VARCHAR(10) NOT NULL,
  PosEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (PosId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.linea
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.linea (
  LinId INT(11) NOT NULL,
  LinEstado TINYINT(1) NOT NULL DEFAULT '0',
  poscosecha_PosId INT(11) NOT NULL,
  PRIMARY KEY (LinId, poscosecha_PosId),
  INDEX fk_linea_poscosecha1_idx (poscosecha_PosId ASC),
  CONSTRAINT fk_linea_poscosecha1
    FOREIGN KEY (poscosecha_PosId)
    REFERENCES lotusproyect.poscosecha (PosId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.maegrados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.maegrados (
  MaeId INT(11) NOT NULL,
  GraID INT(11) NOT NULL,
  PRIMARY KEY (MaeId, GraID),
  INDEX fk_maestro_has_grados_grados1_idx (GraID ASC),
  INDEX fk_maestro_has_grados_maestro1_idx (MaeId ASC),
  CONSTRAINT fk_maestro_has_grados_grados1
    FOREIGN KEY (GraID)
    REFERENCES lotusproyect.grados (GraID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_maestro_has_grados_maestro1
    FOREIGN KEY (MaeId)
    REFERENCES lotusproyect.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.marcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.marcacion (
  MarId INT(11) NOT NULL,
  MarNombre VARCHAR(45) NOT NULL,
  MarPortada MEDIUMTEXT NULL DEFAULT NULL,
  MarEstado TINYINT(1) NOT NULL DEFAULT '0',
  Armado_ArmId INT(11) NOT NULL,
  PRIMARY KEY (MarId, Armado_ArmId),
  INDEX fk_marcacion_Armado1 (Armado_ArmId ASC),
  CONSTRAINT fk_marcacion_Armado1
    FOREIGN KEY (Armado_ArmId)
    REFERENCES lotusproyect.armado (ArmId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.tipoms
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.tipoms (
  TiMId INT(11) NOT NULL,
  TiMNombre VARCHAR(45) NOT NULL,
  TiMDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (TiMId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.materialseco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.materialseco (
  MsId INT(11) NOT NULL,
  TipoMs_TiMId INT(11) NOT NULL,
  MsNombre VARCHAR(45) NOT NULL,
  MsImagen MEDIUMTEXT NULL DEFAULT NULL,
  MsDescripcion MEDIUMTEXT NOT NULL,
  MsEstado TINYINT(1) NOT NULL DEFAULT '0',
  MsAlto INT(3) NOT NULL,
  MsAncho INT(3) NOT NULL,
  MsProfundo INT(3) NOT NULL,
  PRIMARY KEY (MsId),
  INDEX fk_MaterialSeco_TipoMs1 (TipoMs_TiMId ASC),
  CONSTRAINT fk_MaterialSeco_TipoMs1
    FOREIGN KEY (TipoMs_TiMId)
    REFERENCES lotusproyect.tipoms (TiMId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.menu (
  MenuId INT(11) NOT NULL,
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
    REFERENCES lotusproyect.marcacion (MarId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.materialseco_has_menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.materialseco_has_menu (
  MaterialSeco_MsId INT(11) NOT NULL,
  Menu_MenuId INT(11) NOT NULL,
  MsMenUbicacion VARCHAR(100) NULL DEFAULT NULL,
  MsMenImagen MEDIUMTEXT NULL DEFAULT NULL,
  MsMenCantidad INT(2) NULL DEFAULT NULL,
  PRIMARY KEY (MaterialSeco_MsId, Menu_MenuId),
  INDEX fk_MaterialSeco_has_Menu_Menu1 (Menu_MenuId ASC),
  CONSTRAINT fk_MaterialSeco_has_Menu_MaterialSeco1
    FOREIGN KEY (MaterialSeco_MsId)
    REFERENCES lotusproyect.materialseco (MsId),
  CONSTRAINT fk_MaterialSeco_has_Menu_Menu1
    FOREIGN KEY (Menu_MenuId)
    REFERENCES lotusproyect.menu (MenuId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.parametros
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.parametros (
  ParId INT(11) NOT NULL,
  ParNombre VARCHAR(45) NOT NULL,
  ParEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ParId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.parproducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.parproducto (
  grados_GraID INT(11) NOT NULL,
  parametros_ParId INT(11) NOT NULL,
  productos_ProId INT(11) NULL DEFAULT NULL,
  variedad_VarId INT(11) NULL DEFAULT NULL,
  PaProDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PaProFoto VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (grados_GraID, parametros_ParId),
  INDEX fk_grados_has_parametros_parametros1 (parametros_ParId ASC),
  INDEX fk_parproducto_variedad1_idx (variedad_VarId ASC),
  INDEX fk_parproducto_productos1_idx (productos_ProId ASC),
  CONSTRAINT fk_grados_has_parametros_grados1
    FOREIGN KEY (grados_GraID)
    REFERENCES lotusproyect.grados (GraID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_grados_has_parametros_parametros1
    FOREIGN KEY (parametros_ParId)
    REFERENCES lotusproyect.parametros (ParId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_parproducto_productos1
    FOREIGN KEY (productos_ProId)
    REFERENCES lotusproyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_parproducto_variedad1
    FOREIGN KEY (variedad_VarId)
    REFERENCES lotusproyect.variedad (VarId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.paso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.paso (
  PasId INT(11) NOT NULL,
  PasOrden INT(11) NOT NULL,
  PasDescripcion MEDIUMTEXT NOT NULL,
  PasImagen VARCHAR(45) NOT NULL,
  armado_ArmId INT(11) NOT NULL,
  PRIMARY KEY (PasId, armado_ArmId),
  INDEX fk_paso_armado1_idx (armado_ArmId ASC),
  CONSTRAINT fk_paso_armado1
    FOREIGN KEY (armado_ArmId)
    REFERENCES lotusproyect.armado (ArmId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.permiso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.permiso (
  PerId INT(11) NOT NULL AUTO_INCREMENT,
  PerNombre VARCHAR(45) NOT NULL,
  PerModulo VARCHAR(45) NOT NULL,
  PerDescripcion MEDIUMTEXT NOT NULL,
  PerIco VARCHAR(20) NOT NULL,
  PerUrl VARCHAR(100) NOT NULL,
  PerEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (PerId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.rol
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.rol (
  RolId INT(11) NOT NULL AUTO_INCREMENT,
  RolNombre VARCHAR(45) NOT NULL,
  RolDescripcion MEDIUMTEXT NOT NULL,
  RolEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (RolId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.usuario (
  UsuCedula VARCHAR(10) NOT NULL,
  UsuNombre VARCHAR(45) NOT NULL,
  UsuApellido VARCHAR(45) NOT NULL,
  UsuLoger VARCHAR(15) NOT NULL,
  UsuPassword VARCHAR(255) NOT NULL,
  UsuExtencion VARCHAR(4) NOT NULL,
  UsuTelefono VARCHAR(10) NULL DEFAULT NULL,
  UsuEmail VARCHAR(60) NOT NULL,
  UsuEstado TINYINT(1) NOT NULL DEFAULT '0',
  RolId INT(11) NOT NULL,
  PRIMARY KEY (UsuCedula, RolId),
  UNIQUE INDEX UsuId_UNIQUE (UsuCedula ASC),
  INDEX fk_usuario_rol1_idx (RolId ASC),
  CONSTRAINT fk_usuario_rol1
    FOREIGN KEY (RolId)
    REFERENCES lotusproyect.rol (RolId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.poscusuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.poscusuario (
  PosId INT(11) NOT NULL,
  UsuCedula VARCHAR(10) NOT NULL,
  PRIMARY KEY (PosId, UsuCedula),
  INDEX fk_poscosecha_has_usuario_usuario1_idx (UsuCedula ASC),
  INDEX fk_poscosecha_has_usuario_poscosecha1_idx (PosId ASC),
  CONSTRAINT fk_poscosecha_has_usuario_poscosecha1
    FOREIGN KEY (PosId)
    REFERENCES lotusproyect.poscosecha (PosId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_poscosecha_has_usuario_usuario1
    FOREIGN KEY (UsuCedula)
    REFERENCES lotusproyect.usuario (UsuCedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.preliminar
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.preliminar (
  PreId INT(11) NOT NULL,
  PreFecha DATETIME NOT NULL,
  PreEstado ENUM('Pendiente', 'En Curso', 'Finalizada') NOT NULL DEFAULT 'Pendiente',
  Poscosecha_PosNombre INT(11) NOT NULL,
  PRIMARY KEY (PreId),
  INDEX fk_Preliminar_Poscosecha1 (Poscosecha_PosNombre ASC),
  CONSTRAINT fk_Preliminar_Poscosecha1
    FOREIGN KEY (Poscosecha_PosNombre)
    REFERENCES lotusproyect.poscosecha (PosId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.preliminar_has_marcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.preliminar_has_marcacion (
  Preliminar_PreId INT(11) NOT NULL,
  Marcacion_MarId INT(11) NOT NULL,
  PRIMARY KEY (Preliminar_PreId, Marcacion_MarId),
  INDEX fk_Preliminar_has_Marcacion_Marcacion1 (Marcacion_MarId ASC),
  CONSTRAINT fk_Preliminar_has_Marcacion_Marcacion1
    FOREIGN KEY (Marcacion_MarId)
    REFERENCES lotusproyect.marcacion (MarId),
  CONSTRAINT fk_Preliminar_has_Marcacion_Preliminar1
    FOREIGN KEY (Preliminar_PreId)
    REFERENCES lotusproyect.preliminar (PreId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.productos_has_menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.productos_has_menu (
  productos_ProId INT(11) NOT NULL,
  menu_MenuId INT(11) NOT NULL,
  PRIMARY KEY (productos_ProId, menu_MenuId),
  INDEX fk_productos_has_menu_menu1 (menu_MenuId ASC),
  CONSTRAINT fk_productos_has_menu_menu1
    FOREIGN KEY (menu_MenuId)
    REFERENCES lotusproyect.menu (MenuId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_productos_has_menu_productos1
    FOREIGN KEY (productos_ProId)
    REFERENCES lotusproyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table lotusproyect.rolpermiso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lotusproyect.rolpermiso (
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
    REFERENCES lotusproyect.permiso (PerId),
  CONSTRAINT fk_Rol_has_Permiso_Rol1
    FOREIGN KEY (RolId)
    REFERENCES lotusproyect.rol (RolId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
