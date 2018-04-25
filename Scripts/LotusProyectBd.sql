-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema LotusProyect
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LotusProyect
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS LotusProyect DEFAULT CHARACTER SET utf8 ;
USE LotusProyect ;

-- -----------------------------------------------------
-- Table LotusProyect.paso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.paso (
  PasId INT(11) NOT NULL,
  PasOrden INT(11) NOT NULL,
  PasDescripcion MEDIUMTEXT NOT NULL,
  PasImagen VARCHAR(45) NOT NULL,
  PRIMARY KEY (PasId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.armado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.armado (
  ArmId INT(11) NOT NULL,
  ArmNombre VARCHAR(45) NULL DEFAULT NULL,
  ArmDescricion VARCHAR(45) NULL DEFAULT NULL,
  ArmEstado boolean NOT NULL DEFAULT false,
  Paso_PasId INT(11) NOT NULL,
  PRIMARY KEY (ArmId, Paso_PasId),
  INDEX fk_Armado_Paso1 (Paso_PasId ASC),
  CONSTRAINT fk_Armado_Paso1
    FOREIGN KEY (Paso_PasId)
    REFERENCES LotusProyect.paso (PasId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.controldecambios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.controldecambios (
  CCId INT(11) NOT NULL,
  CCAntes MEDIUMTEXT NOT NULL,
  CCDespues MEDIUMTEXT NOT NULL,
  CCUsuarios VARCHAR(10) NOT NULL,
  PRIMARY KEY (CCId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.fitosanidad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.fitosanidad (
  FitId INT(11) NOT NULL,
  FitNombre VARCHAR(45) NOT NULL,
  FitDescripcion VARCHAR(45) NOT NULL,
  FitTipo ENUM('Plaga', 'Enfermedad') NULL DEFAULT NULL,
  FitImagen VARCHAR(45) NULL DEFAULT NULL,
  FitEstado boolean NOT NULL DEFAULT false,
  PRIMARY KEY (FitId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.maestro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.maestro (
  MaeId INT(11) NOT NULL AUTO_INCREMENT,
  MaeNombre VARCHAR(45) NOT NULL,
  MaeDescripcion VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (MaeId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.productos (
  ProId INT(11) NOT NULL,
  ProNombre VARCHAR(45) NOT NULL,
  ProEstado boolean NOT NULL DEFAULT false,
  maestro_MaeId INT(11) NOT NULL,
  PRIMARY KEY (ProId, maestro_MaeId),
  INDEX fk_productos_maestro1_idx (maestro_MaeId ASC),
  CONSTRAINT fk_productos_maestro1
    FOREIGN KEY (maestro_MaeId)
    REFERENCES LotusProyect.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.variedad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.variedad (
  VarId INT(11) NOT NULL,
  VarNombre VARCHAR(45) NOT NULL,
  VarEstado boolean NOT NULL DEFAULT false,
  productos_ProId INT(11) NOT NULL,
  VarImagen VARCHAR(45) NULL DEFAULT NULL,
  VarColor VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (VarId, productos_ProId),
  INDEX fk_Variedad_productos1 (productos_ProId ASC),
  CONSTRAINT fk_Variedad_productos1
    FOREIGN KEY (productos_ProId)
    REFERENCES LotusProyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.fitoproducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.fitoproducto (
  Fitosanidad_FitId INT(11) NOT NULL,
  maestro_MaeId INT(11) NULL,
  productos_ProId INT(11) NULL,
  variedad_VarId INT(11) NULL,
  FpArea VARCHAR(45) NOT NULL,
  FpImagen VARCHAR(45) NOT NULL,
  PRIMARY KEY (Fitosanidad_FitId),
  INDEX fk_fitoproducto_maestro1_idx (maestro_MaeId ASC),
  INDEX fk_fitoproducto_productos1_idx (productos_ProId ASC),
  INDEX fk_fitoproducto_variedad1_idx (variedad_VarId ASC),
  CONSTRAINT fk_productos_has_Fitosanidad_Fitosanidad1
    FOREIGN KEY (Fitosanidad_FitId)
    REFERENCES LotusProyect.fitosanidad (FitId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fitoproducto_maestro1
    FOREIGN KEY (maestro_MaeId)
    REFERENCES LotusProyect.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fitoproducto_productos1
    FOREIGN KEY (productos_ProId)
    REFERENCES LotusProyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fitoproducto_variedad1
    FOREIGN KEY (variedad_VarId)
    REFERENCES LotusProyect.variedad (VarId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.grados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.grados (
  GraID INT(11) NOT NULL,
  GraNombre VARCHAR(45) NOT NULL,
  GraDetalles MEDIUMTEXT NULL DEFAULT NULL,
  GraEstado boolean NOT NULL DEFAULT false,
  PRIMARY KEY (GraID))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.poscosecha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.poscosecha (
  PosId INT(11) NOT NULL AUTO_INCREMENT,
  PosNombre VARCHAR(45) NOT NULL,
  PosDireccion VARCHAR(90) NOT NULL,
  PosTelefono VARCHAR(10) NOT NULL,
  PosEstado boolean NOT NULL DEFAULT false,
  PRIMARY KEY (PosId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.linea
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.linea (
  LinId INT(11) NOT NULL,
  LinEstado boolean NOT NULL DEFAULT false,
  poscosecha_PosId INT(11) NOT NULL,
  PRIMARY KEY (LinId, poscosecha_PosId),
  INDEX fk_linea_poscosecha1_idx (poscosecha_PosId ASC),
  CONSTRAINT fk_linea_poscosecha1
    FOREIGN KEY (poscosecha_PosId)
    REFERENCES LotusProyect.poscosecha (PosId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.marcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.marcacion (
  MarId INT(11) NOT NULL,
  MarNombre VARCHAR(45) NOT NULL,
  MarPortada MEDIUMTEXT NULL DEFAULT NULL,
  MarEstado boolean NOT NULL DEFAULT false,
  Armado_ArmId INT(11) NOT NULL,
  PRIMARY KEY (MarId, Armado_ArmId),
  INDEX fk_marcacion_Armado1 (Armado_ArmId ASC),
  CONSTRAINT fk_marcacion_Armado1
    FOREIGN KEY (Armado_ArmId)
    REFERENCES LotusProyect.armado (ArmId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.tipoms
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.tipoms (
  TiMId INT(11) NOT NULL,
  TiMNombre VARCHAR(45) NOT NULL,
  TiMDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (TiMId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.materialseco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.materialseco (
  MsId INT(11) NOT NULL,
  TipoMs_TiMId INT(11) NOT NULL,
  MsNombre VARCHAR(45) NOT NULL,
  MsImagen MEDIUMTEXT NULL DEFAULT NULL,
  MsDescripcion MEDIUMTEXT NOT NULL,
  MsEstado Boolean NOT NULL DEFAULT false,
  MsAlto INT(3) NOT NULL,
  MsAncho INT(3) NOT NULL,
  MsProfundo INT(3) NOT NULL,
  PRIMARY KEY (MsId),
  INDEX fk_MaterialSeco_TipoMs1 (TipoMs_TiMId ASC),
  CONSTRAINT fk_MaterialSeco_TipoMs1
    FOREIGN KEY (TipoMs_TiMId)
    REFERENCES LotusProyect.tipoms (TiMId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.menu (
  MenuId INT(11) NOT NULL,
  Marcacion_MarId INT(11) NOT NULL,
  MenPortada MEDIUMTEXT NULL DEFAULT NULL,
  MenSuperior MEDIUMTEXT NULL DEFAULT NULL,
  MenLongitud MEDIUMTEXT NULL DEFAULT NULL,
  MenCauchos MEDIUMTEXT NULL DEFAULT NULL,
  MenEstado Boolean NULL DEFAULT false,
  MenDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (MenuId, Marcacion_MarId),
  INDEX fk_Menu_Marcacion1 (Marcacion_MarId ASC),
  CONSTRAINT fk_Menu_Marcacion1
    FOREIGN KEY (Marcacion_MarId)
    REFERENCES LotusProyect.marcacion (MarId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.materialseco_has_menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.materialseco_has_menu (
  MaterialSeco_MsId INT(11) NOT NULL,
  Menu_MenuId INT(11) NOT NULL,
  MsMenUbicacion VARCHAR(100) NULL DEFAULT NULL,
  MsMenImagen MEDIUMTEXT NULL DEFAULT NULL,
  MsMenCantidad INT(2) NULL DEFAULT NULL,
  PRIMARY KEY (MaterialSeco_MsId, Menu_MenuId),
  INDEX fk_MaterialSeco_has_Menu_Menu1 (Menu_MenuId ASC),
  CONSTRAINT fk_MaterialSeco_has_Menu_MaterialSeco1
    FOREIGN KEY (MaterialSeco_MsId)
    REFERENCES LotusProyect.materialseco (MsId),
  CONSTRAINT fk_MaterialSeco_has_Menu_Menu1
    FOREIGN KEY (Menu_MenuId)
    REFERENCES LotusProyect.menu (MenuId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.parametros
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.parametros (
  ParId INT(11) NOT NULL,
  ParNombre VARCHAR(45) NOT NULL,
  ParEstado boolean NOT NULL DEFAULT false,
  PRIMARY KEY (ParId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.parproducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.parproducto (
  grados_GraID INT(11) NOT NULL,
  parametros_ParId INT(11) NOT NULL,
  productos_ProId INT(11) NULL,
  variedad_VarId INT(11) NULL,
  PaProDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PaProFoto VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (grados_GraID, parametros_ParId),
  INDEX fk_grados_has_parametros_parametros1 (parametros_ParId ASC),
  INDEX fk_parproducto_variedad1_idx (variedad_VarId ASC),
  INDEX fk_parproducto_productos1_idx (productos_ProId ASC),
  CONSTRAINT fk_grados_has_parametros_grados1
    FOREIGN KEY (grados_GraID)
    REFERENCES LotusProyect.grados (GraID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_grados_has_parametros_parametros1
    FOREIGN KEY (parametros_ParId)
    REFERENCES LotusProyect.parametros (ParId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_parproducto_variedad1
    FOREIGN KEY (variedad_VarId)
    REFERENCES LotusProyect.variedad (VarId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_parproducto_productos1
    FOREIGN KEY (productos_ProId)
    REFERENCES LotusProyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.permiso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.permiso (
  PerId INT(11) NOT NULL auto_increment,
  PerNombre VARCHAR(45) NOT NULL,
  PerModulo VARCHAR(45) NOT NULL,
  PerDescripcion MEDIUMTEXT NOT NULL,
  PerIco varchar(20) NOT NULL,
  PerUrl VARCHAR(100) NOT NULL,
  PerEstado Boolean NOT NULL DEFAULT False,
  PRIMARY KEY (PerId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.preliminar
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.preliminar (
  PreId INT(11) NOT NULL,
  PreFecha DATETIME NOT NULL,
  PreEstado ENUM('Pendiente', 'En Curso', 'Finalizada') NOT NULL DEFAULT 'Pendiente',
  Poscosecha_PosNombre INT(11) NOT NULL,
  PRIMARY KEY (PreId),
  INDEX fk_Preliminar_Poscosecha1 (Poscosecha_PosNombre ASC),
  CONSTRAINT fk_Preliminar_Poscosecha1
    FOREIGN KEY (Poscosecha_PosNombre)
    REFERENCES LotusProyect.poscosecha (PosId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.preliminar_has_marcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.preliminar_has_marcacion (
  Preliminar_PreId INT(11) NOT NULL,
  Marcacion_MarId INT(11) NOT NULL,
  PRIMARY KEY (Preliminar_PreId, Marcacion_MarId),
  INDEX fk_Preliminar_has_Marcacion_Marcacion1 (Marcacion_MarId ASC),
  CONSTRAINT fk_Preliminar_has_Marcacion_Marcacion1
    FOREIGN KEY (Marcacion_MarId)
    REFERENCES LotusProyect.marcacion (MarId),
  CONSTRAINT fk_Preliminar_has_Marcacion_Preliminar1
    FOREIGN KEY (Preliminar_PreId)
    REFERENCES LotusProyect.preliminar (PreId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.productos_has_menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.productos_has_menu (
  productos_ProId INT(11) NOT NULL,
  menu_MenuId INT(11) NOT NULL,
  PRIMARY KEY (productos_ProId, menu_MenuId),
  INDEX fk_productos_has_menu_menu1 (menu_MenuId ASC),
  CONSTRAINT fk_productos_has_menu_menu1
    FOREIGN KEY (menu_MenuId)
    REFERENCES LotusProyect.menu (MenuId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_productos_has_menu_productos1
    FOREIGN KEY (productos_ProId)
    REFERENCES LotusProyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.rol
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.rol (
  RolId INT(11) NOT NULL AUTO_INCREMENT,
  RolNombre VARCHAR(45) NOT NULL,
  RolDescripcion MEDIUMTEXT NOT NULL,
  RolEstado boolean  NOT NULL DEFAULT false,
  PRIMARY KEY (RolId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.rolPermiso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.rolPermiso (
  RolId INT(11) NOT NULL,
  PerId INT(11) NOT NULL,
  rolperLeer Boolean NOT NULL DEFAULT 0,
  rolperNuevo Boolean NOT NULL DEFAULT 0,
  rolperEditar Boolean NOT NULL DEFAULT 0,
  rolperEliminar Boolean NOT NULL DEFAULT 0,
  PRIMARY KEY (RolId, PerId),
  INDEX fk_Rol_has_Permiso_Permiso1 (PerId ASC),
  CONSTRAINT fk_Rol_has_Permiso_Permiso1
    FOREIGN KEY (PerId)
    REFERENCES LotusProyect.permiso (PerId),
  CONSTRAINT fk_Rol_has_Permiso_Rol1
    FOREIGN KEY (RolId)
    REFERENCES LotusProyect.rol (RolId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.usuario (
  UsuCedula VARCHAR(10) NOT NULL,
  UsuNombre VARCHAR(45) NOT NULL,
  UsuApellido VARCHAR(45) NOT NULL,
  UsuLoger VARCHAR(15) NOT NULL,
  UsuPassword VARCHAR(255) NOT NULL,
  UsuExtencion VARCHAR(4) NOT NULL,
  UsuTelefono VARCHAR(10) NULL DEFAULT NULL,
  UsuEmail VARCHAR(60) NOT NULL,
  UsuEstado boolean  NOT NULL DEFAULT false,
  RolId INT(11) NOT NULL,
  PRIMARY KEY (UsuCedula, RolId),
  UNIQUE INDEX UsuId_UNIQUE (UsuCedula ASC),
  INDEX fk_usuario_rol1_idx (RolId ASC),
  CONSTRAINT fk_usuario_rol1
    FOREIGN KEY (RolId)
    REFERENCES LotusProyect.rol (RolId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.maeGrados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.maeGrados (
  MaeId INT(11) NOT NULL,
  GraID INT(11) NOT NULL,
  PRIMARY KEY (MaeId, GraID),
  INDEX fk_maestro_has_grados_grados1_idx (GraID ASC),
  INDEX fk_maestro_has_grados_maestro1_idx (MaeId ASC),
  CONSTRAINT fk_maestro_has_grados_maestro1
    FOREIGN KEY (MaeId)
    REFERENCES LotusProyect.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_maestro_has_grados_grados1
    FOREIGN KEY (GraID)
    REFERENCES LotusProyect.grados (GraID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect.poscUsuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.poscUsuario (
  PosId INT(11) NOT NULL,
  UsuCedula VARCHAR(10) NOT NULL,
  PRIMARY KEY (PosId, UsuCedula),
  INDEX fk_poscosecha_has_usuario_usuario1_idx (UsuCedula ASC),
  INDEX fk_poscosecha_has_usuario_poscosecha1_idx (PosId ASC),
  CONSTRAINT fk_poscosecha_has_usuario_poscosecha1
    FOREIGN KEY (PosId)
    REFERENCES LotusProyect.poscosecha (PosId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_poscosecha_has_usuario_usuario1
    FOREIGN KEY (UsuCedula)
    REFERENCES LotusProyect.usuario (UsuCedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
