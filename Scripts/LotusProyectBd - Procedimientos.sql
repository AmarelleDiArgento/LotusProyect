-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla Rol
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure rolIn (in rNombre VARCHAR(45), in rDescripcion mediumtext, in rEstado tinyint(1))
begin
insert into rol (RolNombre,RolDescripcion,RolEstado) values (rNombre,rDescripcion,rEstado);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure rolMo (in rId INT, in rNombre VARCHAR(45), in rDescripcion mediumtext, in rEstado tinyint(1))
begin
update rol SET RolNombre=rNombre, RolDescripcion=rDescripcion, RolEstado=rEstado where RolId = rId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure rolEl (in rId INT)
begin
delete from rol where RolId = rId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- -----------------------------------------------------

delimiter $$
create procedure rolLi ()
begin
select RolId,RolNombre,RolDescripcion,RolEstado from rol;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure rolCo (in rId INT)
begin
select RolId,RolNombre,RolDescripcion,RolEstado from rol where RolId = rId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla usuario
-- Insertar
-- -----------------------------------------------------
delimiter $$
create procedure usuarioIn (in uCedula VARCHAR(10), in uNombre VARCHAR(45), in uApellido VARCHAR(45), in uLoger VARCHAR(15), in uPass VARCHAR(45),in uExt VARCHAR(4),in uTel VARCHAR(10), in uEmail VARCHAR(60), in uEstado VARCHAR(10), in RolId INT)
begin
insert into usuario (UsuCedula,UsuNombre,UsuApellido,UsuLoger,UsuPassword,UsuExtencion,UsuTelefono,UsuEmail,UsuEstado,RolId) values (uCedula,uNombre,uApellido,uLoger,SHA(uPass),uExt,uTel,uEmail,uEstado,RolId);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------
delimiter $$
create procedure usuarioMo (in uCedula VARCHAR(10), in uNombre VARCHAR(45), in uApellido VARCHAR(45), in uLoger VARCHAR(15), in uPass VARCHAR(255),in uExt VARCHAR(4),in uTel VARCHAR(10), in uEmail VARCHAR(60), in uEstado VARCHAR(10), in RolId INT)
begin
update usuario SET UsuCedula=uCedula,UsuNombre=uNombre,UsuApellido=uApellido,UsuLoger=uLoger,UsuPassword=uPass,UsuExtencion=uExt,UsuTelefono=uTel,UsuEmail=uEmail,UsuEstado=uEstado,RolId=RolId where UsuCedula=uCedula;
end $$
delimiter $$

-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure usuarioEl (in uCedula VARCHAR(10))
begin
delete from usuario where UsuCedula=uCedula;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- -----------------------------------------------------

delimiter $$
create procedure usuarioLi ()
begin
Select UsuCedula,UsuNombre,UsuApellido,UsuLoger,UsuPassword,UsuExtencion,UsuTelefono,UsuEmail,UsuEstado,u.RolId,RolNombre
from usuario as u
inner join rol as r on u.RolId = r.RolId
order by u.UsuNombre;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x cedula
-- -----------------------------------------------------

delimiter $$
create procedure usuarioCo (in uCedula VARCHAR(10))
begin
Select UsuCedula,UsuNombre,UsuApellido,UsuLoger,UsuPassword,UsuExtencion,UsuTelefono,UsuEmail,UsuEstado,u.RolId,RolNombre
from usuario as u
inner join rol as r on u.RolId = r.RolId
where u.UsuCedula=uCedula;
end $$
delimiter $$

-- -----------------------------------------------------
-- Login usuario
-- -----------------------------------------------------

delimiter $$
create procedure usuarioLogin (in uLoger VARCHAR(15), in uPass VARCHAR(45))
begin
Select UsuCedula,UsuNombre,UsuApellido,UsuLoger,UsuPassword,UsuExtencion,UsuTelefono,UsuEmail,UsuEstado,u.RolId, RolNombre
from usuario as u
inner join rol as r on u.RolId = r.RolId
where u.UsuLoger=uLoger and UsuPassword=SHA(uPass);
end $$
delimiter $$

-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla Permisos
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure permisoIn (in pNombre VARCHAR(45), in pModulo varchar(45), in pDescripcion mediumtext, in pUrl varchar(45), in pIco varchar(20), in pEstado tinyint(1))
begin
insert into permiso (PerNombre,PerModulo,PerDescripcion,PerIco,PerUrl,PerEstado) values (pNombre,pModulo,pDescripcion,pIco,pUrl,pEstado);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure permisoMo (in pId int(11), in pNombre VARCHAR(45), in pModulo varchar(45), in pDescripcion mediumtext, in pUrl varchar(45), in pIco varchar(20), in pEstado tinyint(1))
begin
update permiso SET PerNombre=pNombre, PerModulo=pModulo, PerDescripcion=pDescripcion, PerIco=pIco, PerUrl=pUrl, PerEstado=pEstado where PerId = pId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure permisoEl (in pId INT)
begin
delete from permiso where PerId = pId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- -----------------------------------------------------

delimiter $$
create procedure permisoLi ()
begin
select PerNombre,PerModulo,PerDescripcion,PerIco,PerUrl,PerEstado from permiso;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar Menu
-- -----------------------------------------------------

delimiter $$
create procedure perMenu (in uCedula int(11))
begin
Select p.PerNombre, p.PerUrl, p.PerIco
from usuario as u
inner join rol as r on u.RolId = r.RolId
inner join AsignaPermiso as ap on r.RolId = ap.RolId
inner join permiso as p on ap.PerId = p.PerId
where u.UsuCedula= uCedula and p.PerEstado=1 and ap.rolperLeer = 1;
end $$
delimiter $$
-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure permisoCo (in pId INT)
begin
select PerNombre,PerModulo,PerDescripcion,PerIco,PerUrl,PerEstado from permiso where PerId = pId;
end $$
delimiter $$d

-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla AsignaPermiso
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure AsgPerIn (in apRol int(11), in apPer int(11), in apLeer boolean, in apNuevo boolean, in apEditar boolean, in apEliminar boolean)
begin
insert into AsignaPermiso (RolId,PerId,rolperLeer,rolperNuevo,rolperEditar,rolperEliminar) values (apRol,apPer,apLeer,apNuevo,apEditar,apEliminar);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure AsgPerMo (in apRol int(11), in apPer int(11), in apLeer boolean, in apNuevo boolean, in apEditar boolean, in apEliminar boolean)
begin
update AsignaPermiso SET  RolId=apRol,PerId=apPer,rolperLeer=apLeer,rolperNuevo=apNuevo,rolperEditar=apEditar,rolperEliminar=apEliminar where RolId=apRol and PerId=apPer;
end $$
delimiter $$

-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure AsgPerEl (in apRol int(11), in apPer int(11))
begin
delete from AsignaPermiso where RolId=apRol and PerId=apPer;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar x rol
-- -----------------------------------------------------

delimiter $$
create procedure AsgPerLi (in apRol int(11))
begin
Select ap.RolId, r.RolNombre, ap.PerId, p.PerNombre, ap.rolperLeer ,ap.rolperNuevo ,ap.rolperEditar ,ap.rolperEliminar
from rol as r
inner join AsignaPermiso as ap on r.RolId = ap.RolId
inner join permiso as p on ap.PerId = p.PerId
where r.RolId = apRol;
end $$
delimiter $$usuarioLogin

-- -----------------------------------------------------
-- Permisos de sesión
-- -----------------------------------------------------

delimiter $$
create procedure AsgPerSession (in uCedula int(11))
begin
Select p.PerNombre, ap.rolperLeer ,ap.rolperNuevo ,ap.rolperEditar ,ap.rolperEliminar
from usuario as u
inner join rol as r on u.RolId = r.RolId
inner join AsignaPermiso as ap on r.RolId = ap.RolId
inner join permiso as p on ap.PerId = p.PerId
where u.UsuCedula = uCedula;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure AsgPerCo (in apRol int(11), in apPer int(11))
begin
select RolId,PerId,rolperLeer,rolperNuevo,rolperEditar,rolperEliminar from AsignaPermiso where RolId=apRol and PerId=apPer;
end $$
delimiter $$

-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla armado
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure armadoIn (in aNombre varchar(45), in aDescripcion varchar(45),in aEstado tinyint(1))
begin
insert into armado (ArmNombre,ArmDescripcion,ArmEstado) values (aNombre,aDescripcion,aEstado);
end $$ArmId
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure armadoMo (in aId int(11),in aNombre varchar(45), in aDescripcion varchar(45),in aEstado tinyint(1))
begin
update armado SET ArmNombre=aNombre, ArmDescripcion=aDescripcion, ArmEstado=aEstado where ArmId=aId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure armadoLi ()
begin
select ArmId,ArmNombre,ArmDescripcion,ArmEstado from armado;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure armadoCo (in aId INT)
begin
select ArmId,ArmNombre,ArmDescripcion,ArmEstado from armado where ArmId = aId;
end $$
delimiter $$
-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure armadoEl (in aId INT)
begin
delete from armado where  ArmId = aId;
end $$
delimiter $$





-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla controldecambios
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure controldecambiosIn (in cCAntes mediumtext, in cCDespues mediumtext, in cCUsuarios varchar(10))
begin
insert into controldecambios (CCAntes,CCDespues,CCUsuarios) values (cCAntes,cCDespues,cCUsuarios);
end $$CCId
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure controldecambiosMo (in cCId int(11),in cCAntes mediumtext, in cCDespues mediumtext,cCUsuarios varchar(10))
begin
update controldecambios SET CCAntes=cCAntes, CCDespues=cCDespues,CCUsuarios=cCUsuarios where CCId=cCId;
end $$
delimiter $$


-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure controldecambiosLi ()
begin
select CCAntes,CCDespues,CCUsuarios from controldecambios;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure asignaparametroCo (in cCId INT)
begin
select CCAntes,CCDespues,CCUsuarios from controldecambios where CCId=cCId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Eliminar controldecambiosMo
-- -----------------------------------------------------

delimiter $$
create procedure controldecambiosEl (in cCId INT)
begin
delete from controldecambios where  CCId = cCId;
end $$
delimiter $$





-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla fitoproducto
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure fitoproductoIn (in fpArea varchar(45), in fpImagen varchar(45))
begin
insert into fitoproducto (FpArea,FpImagen) values (fpArea,fpImagen);
end $$FitId
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure fitoproductoMo (in fitId int(11),in fpArea varchar(45), in fpImagen varchar(45))
begin
update fitoproducto SET FpArea=fpArea, FpImagen=fpImagen where FitId=fitId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure fitoproductoLi ()
begin
select FpArea,FpImagen from fitoproducto;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------
delimiter $$
create procedure fitoproductoCo (in prId INT)
begin
select FpArea,FpImagen,FitId,MaeId,VarId from fitoproducto where ProId = prId;
end $$
delimiter $$

-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure fitosanidadEl (in fId INT)
begin
delete from fitosanidad where FitId = fId;
end $$
delimiter $$


-


-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla fitosanidad
-- Insertar
-- ---------
--------------------------------------------

delimiter $$
create procedure fitosanidadIn (in FitNombre varchar(45), in FitDescripcion varchar(45),in FitTipo enum ('Plaga','Enfermedad'), in FitImagen varchar (45),in FitEstado tinyint(1))
begin
insert into fitosanidad(FitNombre,FitDescripcion,FitTipo,FitImagen,FitEstado) values (fNombre,fDescripcion,fTipo,fImagen,fEstado);
end $$FitId
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure fitosanidadMo(in fId int(11),in fNombre varchar(45), in fDescripcion varchar(45),in fTipo enum ('Plaga','Enfermedad'),in fImagen varchar(45), in FitEstado tinyint(1))
begin
update fitosanidad SET FitNombre=fNombre, FitDescripcion=fDescripcion, FitTipo=fTipo, FitImagen=fImagen where FitId=fId;
end $$
delimiter $$

- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure fitosanidadLi ()
begin
select FitNombre,FitDescripcion,FitTipo,FitImagen,FitEstado from fitosanidad;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure fitosanidadCo (in fId INT)
begin
select FitNombre,FitDescripcion,FitTipo,FitImagen,FitEstado from fitosanidad where FitId = fId;
end $$
delimiter $$

-- ----------
-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure fitosanidadEl (in fId INT)
begin
delete from fitosanidad where FitId = fId;
end $$
delimiter $$


-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla grados
-- Insertar
-- ---------

--------------------------------------------

delimiter $$
create procedure gradosIn (in GraNombre varchar(45), in GraDetalles mediumtext,in GraEstado tinyint(1))
begin
insert into grados (GraNombre,GraDetalles,GraEstado) values (gNombre,gDetalles,gEstado);
end $$GraID
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure gradosMo(in gId int(11),in gNombre varchar(45), in gDetalles mediumtext,in GraEstado tinyint(1))
begin
update grados SET GraNombre=gNombre, GraDetalles=gDetalles, GraEstado=gEstado where GraID=gID;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure gradosLi ()
begin
select GraNombre,GraDetalles,GraEstado from grados;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure gradosCo (in gId INT)
begin
select GraNombre,GraDetalles,GraEstado from grados where GraID = gID;
end $$
delimiter $$


-- ----------
-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure gradosEl (in gId INT)
begin
delete from grados where GraID = gId;
end $$
delimiter $$


- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla linea
-- Insertar
-- ---------

--------------------------------------------

delimiter $$
create procedure lineaIn (in lnEstado tinyint(1))
begin
insert into linea(LinEstado) values (lnEstado);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure lineaMo(in lnId int(11),in lnEstado tinyint(1))
begin
update linea SET LinEstado=lnEstado where LinId=lnId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure lineaLi ()
begin
select LinEstado from linea;
end $$
delimiter $$
-- ----------
-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure lineaEl (in lnId INT)
begin
delete from linea where LinId = lnId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure lineaCo (in liId INT)
begin
select LinEstado,PosId,FitTipo from linea where LinId = liId;
end $$
delimiter $$



- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla maestro
-- Insertar
-- ---------

--------------------------------------------

delimiter $$
create procedure maestroIn(in MaeNombre varchar(45), in MaeDescripcion varchar(255))
begin
insert into maestro(MaeNombre,MaeDescripcion) values (mNombre,mDescripcion);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure maestroMo(in maId int(11),in maNombre varchar(45), in maDescripcion varchar(45))
begin
update maestro SET MaeNombre=maNombre, MaeDescripcion=maDescripcion where MaeId=maId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure maestroLi ()
begin
select MaeNombre,MaeDescripcion from maestro;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure maestroCo (in maId INT)
begin
select MaeNombre,MaeDescripcion from maestro where MaeId = maId;
end $$
delimiter $$

-- ----------
-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure maestroEl (in maId INT)
begin
delete from maestro where MaeId = maId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla marcacion
-- Insertar
-- ---------

--------------------------------------------
delimiter $$
 create procedure marcacionIn(in MarNombre varchar(45), in MarPortada mediumtext,in MarEstado tinyint(1))
 begin
 insert into marcacion (MarNombre,MarPortada,MarEstado) values (maNombre,maPortada,maEstado);
 end $$
 delimiter $$
 
-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure maestroMo(in maId int(11),in maNombre varchar(45), in maDescripcion varchar(45))
begin
update maestro SET MaeNombre=maNombre, MaeDescripcion=maDescripcion where MaeId=maId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure maestroLi ()
begin
select MaeNombre,MaeDescripcion from maestro;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure maestroCo (in maId INT)
begin
select MaeNombre,MaeDescripcion from maestro where MaeId = maId;
end $$
delimiter $$
-- ----------
-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure maestroEl (in maId INT)
begin
delete from maestro where MaeId = maId;
end $$
delimiter $$


-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla menu
-- Insertar
-- --------- 

--------------------------------------------

delimiter $$
 create procedure menuIn(in mPortada mediumtext, in mSuperior mediumtext,in mLongitud mediumtext,in mCauchos mediumtext,in mEstado tinyint(1),in mDescripcion mediumtext)
 begin
 insert into menu (MenPortada,MenSuperior,MenLongitud,MenCauchos,MenEstado,MenDescripcion) values (mPortada,mSuperior,mLongitud,mCauchos,mEstado,mDescripcion);
 end $$ 

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure menuMo(in meId int(11),in mPortada mediumtext, in mSuperior mediumtext,in mLongitud mediumtext, in mCauchos mediumtext,in mEstado tinyint(1),in mDescripcion mediumtext)
begin
update menu SET MenPortada=mPortada, MenSuperior=mSuperior, MenLongitud=Longitud, MenCauchos=mCauchos,MenEstado=mEstado,MenDescripcion=mDescripcion  where MenuId=meId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure MenuLi ()
begin
select MenPortada,MenSuperior,MenLongitud,MenCauchos,MenEstado,MenDescripcion from menu;
end $$
delimiter $$

-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure menuCo (in menuId INT)
begin
select Marcacion_MarId,MenPortada,MenSuperior,MenLongitud,MenCauchos,MenEstado,MenDescripcion from maestro where MenuId = menuId;
end $$
delimiter $$

-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure menuEl (in marId INT)
begin
delete from menu where MenuId=meId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla parametros
-- Insertar
-- --------- 
--------------------------------------------

delimiter $$
 create procedure parametrosIn(in pNombre varchar(45), in pEstado tinyint(1), in MaeId int(11), in ProId int(11),in VarId int(11))
 begin
 insert into parametros (ParNombre,ParEstado) values (pNombre,pEstado);
 end $$ 

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure parametrosMo(in pId int(11),in pNombre varchar(45), in pEstado tinyint(1))
begin
update parametros SET ParNombre=pNombre, ParEstado=pEstado where ParId=pId;
end $$
delimiter $$


-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure parametrosLi ()
begin
select ParNombre,ParEstado from parametros;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------
delimiter $$
create procedure parametrosCo (in pId INT)
begin
select ParNombre,ParEstado from parametros where ParId = pId;
end $$
delimiter $$
-- ----------
-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure parametrosEl (in pId INT)
begin
delete from parametros where ParId=pId;
end $$
delimiter $$

- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla paso
-- Insertar
-- --------- 

--------------------------------------------

delimiter $$
 create procedure pasoIn(in pOrden int(11), in pDescripcion mediumtext, in pImagen varchar(45))
 begin
 insert into paso (PasOrden,PasDescripcion,PasImagen) values (pOrden,pDescripcion,pImagen);
 end $$ 

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure permisoMo(in peId int(11),in peNombre varchar(45), in peModulo varchar(45), in peDescripcion mediumtext, in PerIco varchar(20), in PerUrl varchar(100), in PerEstado tinyint(1) )
begin
update paso SET PasOrden=pNombre, PasDescripcion=pDescripcion, PasImagen=pImagen where PerId=psId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure pasoLi ()
begin
select PasOrden,PasDescripcion,PasImagen from paso;
end $$
delimiter $$
-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------
delimiter $$
create procedure pasoCo (in psId INT)
begin
select PasOrden,PasDescripcion,PasImagen,ArmId from paso where PasId = psId;
end $$
delimiter $$

-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure pasoEl (in psId INT)
begin
delete from paso where PasId=psId;
end $$
delimiter $$



-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla permiso
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure permisoIn (in peNombre varchar(45), in peModulo varchar(45), in peDescripcion mediumtext, in peIco varchar(20), in peUrl varchar(100), in peEstado tinyint(1))
begin
insert into permiso (PerNombre,PerModulo,PerDescripcion,PerIco,PerUrl,PerEstado) values (peNombre,peModulo,peDescripcion,peIco,peUrl,peEstado);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure permisoMo (in peId int(11),in peNombre varchar(45), in peModulo varchar(45),in peDescripcion mediumtext,in peIco varchar(20), in peUrl varchar(100), in peEstado tinyint(1))
begin
update permiso SET PerNombre=peNombre, PerModulo=peModulo,PerDescripcion=peDescripcion,PerIco=peIco,PerUrl=peUrl,PerEstado=peEstado where PerId=peId;
end $$
delimiter $$
 
 -- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure permisoLi ()
begin
select PerNombre,PerModulo,PerDescripcion,PerIco,PerUrl,PerEstado from permiso;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure permisoCo (in peId INT)
begin
select CCAntes,CCDespues,CCUsuarios from controldecambios where CCId=cCId;
end $$
delimiter $$ 


-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure permisoEl (in peId INT)
begin
delete from permiso where  PerId = peId;
end $$
delimiter $$


 -- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla poscosecha
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure poscosechaIn (in psNombre varchar(45), in psDireccion varchar(90), in psTelefono varchar(10), in PosEstado tinyint(1))
begin
insert into poscosecha (PosNombre,PosDireccion,PosTelefono,PosEstado) values (psNombre,psDireccion,psTelefono,psEstado);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure poscosechaMo (in psId int(11),in psNombre varchar(45), in psDireccion varchar(90),in psTelefono varchar(10),in psEstado tinyint(1))
begin
update poscosecha SET PosNombre=psNombre, PosDireccion=psDireccion,PosTelefono=psTelefono,PosEstado=psEstado where PosId=psId;
end $$
delimiter $$
 
 
-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure poscosechaLi ()
begin
select PosNombre,PosDireccion,PosTelefono,PosEstado from poscosecha;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure poscosechaCo (in psId INT)
begin
select PosNombre,PosDireccion,PosTelefono,PosEstado from poscosecha where PosId=psId;
end $$
delimiter $$ 
-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure poscosechaEl (in psId INT)
begin
delete from poscosecha where  PosId = psId;
end $$
delimiter $$


  -- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla preliminar
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure preliminarIn (in prFecha datetime, in prEstado varchar(15))
begin
insert into preliminar (PreFecha,PreEstado) values (prFecha,prEstado);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure preliminarMo (in PrId int(11),in prFecha datetime, in prEstado enum('Pendiente','EnCurso','Finalizada'))
begin
update preliminar SET PreFecha=prFecha, PreEstado=prEstado where PreId=PrId;
end $$
delimiter $$
 
 -- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure preliminarLi ()
begin
select PreFecha,PreEstado from preliminar;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure preliminarCo (in prId INT)
begin
select PreFecha,PreEstado,PosId from preliminar where PreId=prId;
end $$
delimiter $$ 
-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure preliminarEl (in prId INT)
begin
delete from preliminar where  PreId = prId;
end $$
delimiter $$



 -- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla productos
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure productosIn (in prNombre varchar(45), in prEstado tinyint(1))
begin
insert into productos (ProNombre,ProEstado) values (prNombre,prEstado);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure productosMo (in prId int(11),in prNombre varchar(45), in prEstado tinyint(1))
begin
update productos SET ProNombre=prNombre, ProEstado=prEstado where ProId=prId;
end $$
delimiter $$
 -- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure productosLi ()
begin
select ProNombre,ProEstado from productos;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure productosCo (in prId INT)
begin
select ProNombre,ProEstado,MaeId from producto where ProId=prId;
end $$
delimiter $$ 


-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure productosEl (in prId INT)
begin
delete from productos where  ProId = prId;
end $$
delimiter $$

 -- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla rol
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure rolIn (in rNombre varchar(45), in rDescripcion mediumtext, in rEstado tinyint(1))
begin
insert into rol (RolNombre,RolDescripcion,RolEstado) values (rNombre,rDescripcion,rEstado);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure rolMo (in rId int(11),in RolNombre varchar(45), in RolDescripcion mediumtext, in RolEstado tinyint(1))
begin
update rol SET RolNombre=rNombre, RolDescripcion=rDescripcion, RolEstado= rEstado where RolId=rId;
end $$
delimiter $$
 
-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure rolLi ()
begin
select RolNombre,RolDescripcion,RolEstado from rol;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure rolCo (in rId INT)
begin
select RolNombre,RolDescripcion,RolEstado from rol where RolId = rId;
end $$
delimiter $$



 -- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla tipoms
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure tipomsIn (in tNombre varchar(45), in tDescripcion mediumtext)
begin
insert into tipoms (TiMNombre,TiMDescripcion) values (tNombre,tDescripcion);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure tipomsMo (in tId int(11),in tNombre varchar(45), in tDescripcion mediumtext)
begin
update tipoms SET TiMNombre=tId, TiMDescripcion=tNombre where TiMId=tId;
end $$
delimiter $$
 

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure tipomsLi ()
begin
select TiMNombre,TiMDescripcion from tipoms;
end $$
delimiter $$
-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure tipomsCo (in tId INT)
begin
select TiMNombre,TiMDescripcion from tipoms where TiMId = tId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure tipomsEl (in rId INT)
begin
delete from rol where  RolId = rId;
end $$
delimiter $$
