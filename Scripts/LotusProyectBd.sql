-- -----------------------------------------------------
-- Schema LotusProyect
-- CREATE USER 'lotusproyect'@'localhost' IDENTIFIED BY '1311138C72A04BB7D228AFB9D574ED2D00DFD264C67161A958AD62E32672DEFF';
-- GRANT ALL PRIVILEGES ON * . * TO 'nombre_usuario'@'localhost';
-- FLUSH PRIVILEGES;
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LotusProyect
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS LotusProyect DEFAULT CHARACTER SET utf8 ;

USE LotusProyect ;

-- -----------------------------------------------------
-- Table LotusProyect armado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.armado (
  ArmId INT(11) NOT NULL AUTO_INCREMENT,
  ArmNombre VARCHAR(45) NULL DEFAULT NULL,
  ArmDescricion VARCHAR(45) NULL DEFAULT NULL,
  ArmEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ArmId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect controldecambios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.controldecambios (
  CCId INT(11) NOT NULL AUTO_INCREMENT,
  CCAntes MEDIUMTEXT NOT NULL,
  CCDespues MEDIUMTEXT NOT NULL,
  CCUsuarios VARCHAR(10) NOT NULL,
  PRIMARY KEY (CCId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect maestro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.maestro (
  MaeId INT(11) NOT NULL AUTO_INCREMENT,
  MaeNombre VARCHAR(45) NOT NULL,
  MaeDescripcion VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (MaeId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.productos (
  ProId INT(11) NOT NULL AUTO_INCREMENT,
  ProNombre VARCHAR(45) NOT NULL,
  ProEstado TINYINT(1) NOT NULL DEFAULT '0',
  MaeId INT(11) NOT NULL,
  PRIMARY KEY (ProId, MaeId),
  INDEX fk_productos_maestro1_idx (MaeId ASC),
  CONSTRAINT fk_productos_maestro1
    FOREIGN KEY (MaeId)
    REFERENCES LotusProyect.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect variedad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.variedad (
  VarId INT(11) NOT NULL AUTO_INCREMENT,
  VarNombre VARCHAR(45) NOT NULL,
  VarEstado TINYINT(1) NOT NULL DEFAULT '0',
  ProId INT(11) NOT NULL,
  VarImagen VARCHAR(45) NULL DEFAULT NULL,
  VarColor VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (VarId, ProId),
  INDEX fk_Variedad_productos1 (ProId ASC),
  CONSTRAINT fk_Variedad_productos1
    FOREIGN KEY (ProId)
    REFERENCES LotusProyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect fitosanidad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.fitosanidad (
  FitId INT(11) NOT NULL AUTO_INCREMENT,
  FitNombre VARCHAR(45) NOT NULL,
  FitDescripcion VARCHAR(45) NOT NULL,
  FitTipo ENUM('Plaga', 'Enfermedad') NULL DEFAULT NULL,
  FitImagen VARCHAR(45) NULL DEFAULT NULL,
  FitEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (FitId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect fitoproducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.fitoproducto (
  FitId INT(11) NOT NULL AUTO_INCREMENT,
  MaeId INT(11) NULL DEFAULT NULL,
  ProId INT(11) NULL DEFAULT NULL,
  VarId INT(11) NULL DEFAULT NULL,
  FpArea VARCHAR(45) NOT NULL,
  FpImagen VARCHAR(45) NOT NULL,
  PRIMARY KEY (FitId),
  INDEX fk_fitoproducto_maestro1_idx (MaeId ASC),
  INDEX fk_fitoproducto_productos1_idx (ProId ASC),
  INDEX fk_fitoproducto_variedad1_idx (VarId ASC),
  CONSTRAINT fk_fitoproducto_maestro1
    FOREIGN KEY (MaeId)
    REFERENCES LotusProyect.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fitoproducto_productos1
    FOREIGN KEY (ProId)
    REFERENCES LotusProyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fitoproducto_variedad1
    FOREIGN KEY (VarId)
    REFERENCES LotusProyect.variedad (VarId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_productos_has_Fitosanidad_Fitosanidad1
    FOREIGN KEY (FitId)
    REFERENCES LotusProyect.fitosanidad (FitId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect grados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.grados (
  GraID INT(11) NOT NULL AUTO_INCREMENT,
  GraNombre VARCHAR(45) NOT NULL,
  GraDetalles MEDIUMTEXT NULL DEFAULT NULL,
  GraEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (GraID))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect poscosecha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.poscosecha (
  PosId INT(11) NOT NULL AUTO_INCREMENT,
  PosNombre VARCHAR(45) NOT NULL,
  PosDireccion VARCHAR(90) NOT NULL,
  PosTelefono VARCHAR(10) NOT NULL,
  PosEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (PosId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect linea
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.linea (
  LinId INT(11) NOT NULL AUTO_INCREMENT,
  LinEstado TINYINT(1) NOT NULL DEFAULT '0',
  PosId INT(11) NOT NULL,
  PRIMARY KEY (LinId, PosId),
  INDEX fk_linea_poscosecha1_idx (PosId ASC),
  CONSTRAINT fk_linea_poscosecha1
    FOREIGN KEY (PosId)
    REFERENCES LotusProyect.poscosecha (PosId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect AsignaMaestro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.AsignaMaestro (
  MaeId INT(11) NOT NULL,
  GraID INT(11) NOT NULL,
  PRIMARY KEY (MaeId, GraID),
  INDEX fk_maestro_has_grados_grados1_idx (GraID ASC),
  INDEX fk_maestro_has_grados_maestro1_idx (MaeId ASC),
  CONSTRAINT fk_maestro_has_grados_grados1
    FOREIGN KEY (GraID)
    REFERENCES LotusProyect.grados (GraID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_maestro_has_grados_maestro1
    FOREIGN KEY (MaeId)
    REFERENCES LotusProyect.maestro (MaeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect marcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.marcacion (
  MarId INT(11) NOT NULL AUTO_INCREMENT,
  MarNombre VARCHAR(45) NOT NULL,
  MarPortada MEDIUMTEXT NULL DEFAULT NULL,
  MarEstado TINYINT(1) NOT NULL DEFAULT '0',
  ArmId INT(11) NOT NULL,
  PRIMARY KEY (MarId, ArmId),
  INDEX fk_marcacion_Armado1 (ArmId ASC),
  CONSTRAINT fk_marcacion_Armado1
    FOREIGN KEY (ArmId)
    REFERENCES LotusProyect.armado (ArmId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect tipoms
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.tipoms (
  TiMId INT(11) NOT NULL AUTO_INCREMENT,
  TiMNombre VARCHAR(45) NOT NULL,
  TiMDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (TiMId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect materialseco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.materialseco (
  MsId INT(11) NOT NULL AUTO_INCREMENT,
  TiMId INT(11) NOT NULL,
  MsNombre VARCHAR(45) NOT NULL,
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
    REFERENCES LotusProyect.tipoms (TiMId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.menu (
  MenuId INT(11) NOT NULL AUTO_INCREMENT,
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
    REFERENCES LotusProyect.marcacion (MarId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect AsignaMatSeco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.AsignaMatSeco (
  MsId INT(11) NOT NULL AUTO_INCREMENT,
  MenuId INT(11) NOT NULL,
  MsMenUbicacion VARCHAR(100) NULL DEFAULT NULL,
  MsMenImagen MEDIUMTEXT NULL DEFAULT NULL,
  MsMenCantidad INT(2) NULL DEFAULT NULL,
  PRIMARY KEY (MsId, MenuId),
  INDEX fk_MaterialSeco_has_Menu_Menu1 (MenuId ASC),
  CONSTRAINT fk_MaterialSeco_has_Menu_MaterialSeco1
    FOREIGN KEY (MsId)
    REFERENCES LotusProyect.materialseco (MsId),
  CONSTRAINT fk_MaterialSeco_has_Menu_Menu1
    FOREIGN KEY (MenuId)
    REFERENCES LotusProyect.menu (MenuId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect parametros
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.parametros (
  ParId INT(11) NOT NULL AUTO_INCREMENT,
  ParNombre VARCHAR(45) NOT NULL,
  ParEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ParId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect AsignaParametro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.AsignaParametro (
  GraID INT(11) NOT NULL,
  ParId INT(11) NOT NULL,
  ProId INT(11) NULL DEFAULT NULL,
  VarId INT(11) NULL DEFAULT NULL,
  PaProDescripcion MEDIUMTEXT NULL DEFAULT NULL,
  PaProFoto VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (GraID, ParId),
  INDEX fk_grados_has_parametros_parametros1 (ParId ASC),
  INDEX fk_parproducto_variedad1_idx (VarId ASC),
  INDEX fk_parproducto_productos1_idx (ProId ASC),
  CONSTRAINT fk_grados_has_parametros_grados1
    FOREIGN KEY (GraID)
    REFERENCES LotusProyect.grados (GraID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_grados_has_parametros_parametros1
    FOREIGN KEY (ParId)
    REFERENCES LotusProyect.parametros (ParId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_parproducto_productos1
    FOREIGN KEY (ProId)
    REFERENCES LotusProyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_parproducto_variedad1
    FOREIGN KEY (VarId)
    REFERENCES LotusProyect.variedad (VarId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect paso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.paso (
  PasId INT(11) NOT NULL AUTO_INCREMENT,
  PasOrden INT(11) NOT NULL,
  PasDescripcion MEDIUMTEXT NOT NULL,
  PasImagen VARCHAR(45) NOT NULL,
  ArmId INT(11) NOT NULL,
  PRIMARY KEY (PasId, ArmId),
  INDEX fk_paso_armado1_idx (ArmId ASC),
  CONSTRAINT fk_paso_armado1
    FOREIGN KEY (ArmId)
    REFERENCES LotusProyect.armado (ArmId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect permiso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.permiso (
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
-- Table LotusProyect rol
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.rol (
  RolId INT(11) NOT NULL AUTO_INCREMENT,
  RolNombre VARCHAR(45) NOT NULL,
  RolDescripcion MEDIUMTEXT NOT NULL,
  RolEstado TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (RolId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect usuario
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
  UsuEstado TINYINT(1) NOT NULL DEFAULT '0',
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
-- Table LotusProyect AsignaPoscosecha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.AsignaPoscosecha (
  PosId INT(11) NOT NULL AUTO_INCREMENT,
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


-- -----------------------------------------------------
-- Table LotusProyect preliminar
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.preliminar (
  PreId INT(11) NOT NULL AUTO_INCREMENT,
  PreFecha DATETIME NOT NULL,
  PreEstado ENUM('Pendiente', 'En Curso', 'Finalizada') NOT NULL DEFAULT 'Pendiente',
  PosId INT(11) NOT NULL,
  PRIMARY KEY (PreId, PosId),
  INDEX fk_preliminar_poscosecha1_idx (PosId ASC),
  CONSTRAINT fk_preliminar_poscosecha1
    FOREIGN KEY (PosId)
    REFERENCES LotusProyect.poscosecha (PosId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect AsignaMarcacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.AsignaMarcacion (
  PreId INT(11) NOT NULL,
  MarId INT(11) NOT NULL,
  PRIMARY KEY (PreId, MarId),
  INDEX fk_Preliminar_has_Marcacion_Marcacion1 (MarId ASC),
  CONSTRAINT fk_Preliminar_has_Marcacion_Marcacion1
    FOREIGN KEY (MarId)
    REFERENCES LotusProyect.marcacion (MarId),
  CONSTRAINT fk_Preliminar_has_Marcacion_Preliminar1
    FOREIGN KEY (PreId)
    REFERENCES LotusProyect.preliminar (PreId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect AsignaProducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.AsignaProducto (
  ProId INT(11) NOT NULL,
  MenuId INT(11) NOT NULL,
  Tallos INT(11) NULL,
  PRIMARY KEY (ProId, MenuId),
  INDEX fk_productos_has_menu_menu1 (MenuId ASC),
  CONSTRAINT fk_productos_has_menu_menu1
    FOREIGN KEY (MenuId)
    REFERENCES LotusProyect.menu (MenuId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_productos_has_menu_productos1
    FOREIGN KEY (ProId)
    REFERENCES LotusProyect.productos (ProId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table LotusProyect AsignaPermiso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LotusProyect.AsignaPermiso (
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
    REFERENCES LotusProyect.permiso (PerId),
  CONSTRAINT fk_Rol_has_Permiso_Rol1
    FOREIGN KEY (RolId)
    REFERENCES LotusProyect.rol (RolId))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;