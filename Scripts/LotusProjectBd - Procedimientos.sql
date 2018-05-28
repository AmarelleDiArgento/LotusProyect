-- -----------------------------------------------------
-- Procedimientos LotusProject Tabla Rol
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
-- Procedimientos LotusProject Tabla usuario
-- Insertar
-- -----------------------------------------------------
delimiter $$
create procedure usuarioIn (in uCedula VARCHAR(10), in uNombre VARCHAR(45), in uApellido VARCHAR(45), in uLoger VARCHAR(15), in uPass VARCHAR(45),in uExt VARCHAR(4),in uTel VARCHAR(10), in uEmail VARCHAR(60), in uAvatar VARCHAR(60), in uEstado VARCHAR(10), in RolId INT)
begin
insert into usuario (UsuCedula,UsuNombre,UsuApellido,UsuLoger,UsuPassword,UsuExtencion,UsuTelefono,UsuEmail,UsuAvatar,UsuEstado,RolId) values (uCedula,uNombre,uApellido,uLoger,SHA(uPass),uExt,uTel,uEmail,uAvatar,uEstado,RolId);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------
delimiter $$
create procedure usuarioMo (in uCedula VARCHAR(10), in uNombre VARCHAR(45), in uApellido VARCHAR(45), in uLoger VARCHAR(15), in uPass VARCHAR(255),in uExt VARCHAR(4),in uTel VARCHAR(10), in uEmail VARCHAR(60),in uAvatar VARCHAR(60), in uEstado VARCHAR(10), in RolId INT)
begin
update usuario SET UsuCedula=uCedula,UsuNombre=uNombre,UsuApellido=uApellido,UsuLoger=uLoger,UsuPassword=uPass,UsuExtencion=uExt,UsuTelefono=uTel,UsuEmail=uEmail,UsuAvatar=uAvatar,UsuEstado=uEstado,RolId=RolId where UsuCedula=uCedula;
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
Select UsuCedula,UsuNombre,UsuApellido,UsuLoger,UsuPassword,UsuExtencion,UsuTelefono,UsuEmail,UsuAvatar,UsuEstado,u.RolId,RolNombre
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
Select UsuCedula,UsuNombre,UsuApellido,UsuLoger,UsuPassword,UsuExtencion,UsuTelefono,UsuEmail,UsuAvatar,UsuEstado,u.RolId,RolNombre
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
Select UsuCedula,UsuNombre,UsuApellido,UsuLoger,UsuPassword,UsuExtencion,UsuTelefono,UsuEmail,UsuEstado,UsuAvatar,u.RolId, RolNombre
from usuario as u
inner join rol as r on u.RolId = r.RolId
where u.UsuLoger=uLoger and UsuPassword=SHA(uPass);
end $$
delimiter $$

-- -----------------------------------------------------
-- Procedimientos LotusProject Tabla Permisos
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
select PerId,PerNombre,PerModulo,PerDescripcion,PerIco,PerUrl,PerEstado from permiso;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar Menu
-- -----------------------------------------------------

delimiter $$
create procedure perMenu (in uCedula int(11))
begin
Select p.PerId,p.PerNombre, p.PerUrl, p.PerIco
from usuario as u
inner join rol as r on u.RolId = r.RolId
inner join asignapermiso as ap on r.RolId = ap.RolId
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
-- Procedimientos LotusProject Tabla AsignaPermiso
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure AsgPerIn (in apRol int(11), in apPer int(11), in apLeer boolean, in apNuevo boolean, in apEditar boolean, in apEliminar boolean)
begin
insert into asignapermiso (RolId,PerId,rolperLeer,rolperNuevo,rolperEditar,rolperEliminar) values (apRol,apPer,apLeer,apNuevo,apEditar,apEliminar);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure AsgPerMo (in apRol int(11), in apPer int(11), in apLeer boolean, in apNuevo boolean, in apEditar boolean, in apEliminar boolean)
begin
update asignapermiso SET  RolId=apRol,PerId=apPer,rolperLeer=apLeer,rolperNuevo=apNuevo,rolperEditar=apEditar,rolperEliminar=apEliminar where RolId=apRol and PerId=apPer;
end $$
delimiter $$

-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure AsgPerEl (in apRol int(11), in apPer int(11))
begin
delete from asignapermiso where RolId=apRol and PerId=apPer;
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
inner join asignapermiso as ap on r.RolId = ap.RolId
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
inner join asignapermiso as ap on r.RolId = ap.RolId
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
select RolId,PerId,rolperLeer,rolperNuevo,rolperEditar,rolperEliminar from asignapermiso where RolId=apRol and PerId=apPer;
end $$
delimiter $$

delimiter $$
create procedure asignaParXProLi (in apProID INT)
begin
SELECT ap.GraID, g.GraNombre, ap.ParId, pa.ParNombre, ap.ProId, pr.ProNombre, ap.VarId, v.VarEstado, ap.PaProDescripcion, ap.PaProFoto
FROM AsignaParametro AS ap
INNER JOIN grados AS g ON ap.GraID = g.GraID
INNER JOIN parametros AS pa ON ap.ParId = pa.ParId
INNER JOIN productos AS pr ON ap.ProId = pr.ProId
INNER JOIN variedad AS v ON v.ProId = pr.ProId AND ap.VarId = v.VarId
WHERE ap.ProId = apProID;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar Parametros de variedad
-- -----------------------------------------------------

delimiter $$
create procedure asignaParXVarLi (in apVarID INT)
begin
SELECT ap.GraID, g.GraNombre, ap.ParId, pa.ParNombre, ap.ProId, pr.ProNombre, ap.VarId, v.VarEstado, ap.PaProDescripcion, ap.PaProFoto
FROM AsignaParametro AS ap
INNER JOIN grados AS g ON ap.GraID = g.GraID
INNER JOIN parametros AS pa ON ap.ParId = pa.ParId
INNER JOIN productos AS pr ON ap.ProId = pr.ProId
INNER JOIN variedad AS v ON v.ProId = pr.ProId AND ap.VarId = v.VarId
WHERE ap.VarId = apVarID;
end $$
delimiter $$

-- -----------------------------------------------------
-- Procedimientos LotusProject Tabla armado
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure armadoIn (in aNombre varchar(45), in adescripcion mediumtext,in aEstado tinyint(1))
begin
insert into armado (ArmNombre,ArmDescripcion,ArmEstado) values (aNombre,aDescripcion,aEstado);
end $$ArmId
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure armadoMo (in aId int(11),in aNombre varchar(45), in adescripcion mediumtext,in aEstado tinyint(1))
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
-- Procedimientos LotusProject Tabla controldecambios
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
create procedure controldecambiosMo (in cCId int(11),in cCAntes mediumtext, in cCDespues mediumtext,in cCUsuarios varchar(10))
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
select CCId,CCAntes,CCDespues,CCUsuarios from controldecambios;
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
-- Eliminar controldecambios
-- -----------------------------------------------------

delimiter $$
create procedure controldecambiosEl (in cCId INT)
begin
delete from controldecambios where  CCId = cCId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Procedimientos LotusProject Tabla fitoproducto
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure fitoproductoIn (in fpArea varchar(45), in fpImagen varchar(45),in maeId int(11),in proId int(11),in varId int(11))
begin
insert into fitoproducto (FpArea,FpImagen,MaeId,ProId,VarId) values (fpArea,fpImagen,maeId,proId,varId);
end $$FitId
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure fitoproductoMo (in fpArea varchar(45), in fpImagen varchar(45),in maeId int(11),in proId int(11),in varId int(11))
begin
update fitoproducto SET FpArea=fpArea, FpImagen=fpImagen,MaeId=maeId,ProId=proId,VarId=varId  where FitId=fitId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure fitoproductoLi ()
begin
select FpArea,FpImagen,MaeId,ProId,VarId from fitoproducto;
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
create procedure fitoproductoEl (in fitId INT)
begin
delete from fitoproducto where FitId = fitId;
end $$
delimiter $$






-- -----------------------------------------------------
-- Procedimientos LotusProject Tabla fitosanidad
-- Insertar
-- ---------
--------------------------------------------

delimiter $$
create procedure fitosanidadIn (in fNombre varchar(45), in fdescripcion mediumtext,in fTipo enum ('Plaga','Enfermedad'), in fImagen varchar (45),in fEstado tinyint(1))
begin
insert into fitosanidad(FitNombre,FitDescripcion,FitTipo,FitImagen,FitEstado) values (fNombre,fDescripcion,fTipo,fImagen,fEstado);
end $$FitId
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure fitosanidadMo(in fId int(11),in fNombre varchar(45), in fdescripcion mediumtext,in fTipo enum ('Plaga','Enfermedad'),in fImagen varchar(45), in FitEstado tinyint(1))
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
select FitId,FitNombre,FitDescripcion,FitTipo,FitImagen,FitEstado from fitosanidad;
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
-- Procedimientos LotusProject Tabla grados
-- Insertar
-- ---------

--------------------------------------------

delimiter $$
create procedure gradosIn (in gNombre varchar(45), in gDetalles mediumtext,in gEstado tinyint(1))
begin
insert into grados (GraNombre,GraDetalles,GraEstado) values (gNombre,gDetalles,gEstado);
end $$GraID
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure gradosMo(in gId int(11),in gNombre varchar(45), in gDetalles mediumtext,in gEstado tinyint(1))
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
select GraID,GraNombre,GraDetalles,GraEstado from grados;
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
-- Procedimientos LotusProject Tabla linea
-- Insertar
-- ---------


delimiter $$
create procedure lineaIn (in lnEstado tinyint(1), in lPosId int(11))
begin
insert into linea(LinEstado,PosId) values (lnEstado,lPosId);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure lineaMo(in lnId int(11),in lnEstado tinyint(1))
begin
update linea SET LinEstado=lnEstado,PosId=lPosId where LinId=lnId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure lineaLi ()
begin
select *
from linea as li inner join poscosecha as po on li.PosId = po.PosId;
end $$
delimiter $$


-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure lineaCo (in liId INT)
begin
select *
from linea as li inner join poscosecha as po on li.PosId=po.PosId;
end $$
delimiter $$

-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure lineaEl (in lnId INT)
begin
delete from linea where LinId = lnId;
end $$
delimiter $$





- -----------------------------------------------------
-- Procedimientos LotusProject Tabla maestro
-- Insertar
-- ---------

--------------------------------------------

delimiter $$
create procedure maestroIn(in mNombre varchar(45), in mdescripcion mediumtext)
begin
insert into maestro(MaeNombre,MaeDescripcion) values (mNombre,mDescripcion);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure maestroMo(in maId int(11),in maNombre varchar(45), in madescripcion mediumtext)
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
select MaeId,MaeNombre,MaeDescripcion from maestro;
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
-- Procedimientos LotusProject Tabla marcacion
-- Insertar
-- ---------

delimiter $$
 create procedure marcacionIn(in marNombre varchar(45), in marPortada mediumtext,in marEstado tinyint(1), in armId int(11))
 begin
 insert into marcacion (MarNombre,MarPortada,MarEstado,ArmId) values (marNombre,marPortada,marEstado,armId);
 end $$
 delimiter $$
 
-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure marcacionMo(in marId int(11),in marNombre varchar(45), in marPortada mediumtext,in marEstado tinyint(1),in armId int(11))
begin
update marcacion SET MarNombre=marNombre, MarPortada=marPortada,MarEstado=marEstado, ArmId=armId where MaeId=maId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure marcacionLi ()
begin
select *
from marcacion as ma inner join armado as ar on ma.ArmId = ar.ArmId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure marcacionCo (in marId INT)
begin
select *
from marcacion as ma inner join armado as a on ma.ArmId = a.ArmId;
end $$
delimiter $$
-- ----------
-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure marcacionEl (in marId INT)
begin
delete from marcacion where MarId = marId;
end $$
delimiter $$



-- -----------------------------------------------------
-- Procedimientos LotusProject Tabla materialseco
-- Insertar
-- ---------

delimiter $$
 create procedure materialsecoIn(in msNombre varchar(45), in msImagen mediumtext,in msDescripcion mediumtext, in msEstado tinyint(1), in msAlto int(3),in msAncho int(3),in msProfundo int(3),in TiMId int(11))
 begin
 insert into materialseco (MsNombre,MsImagen,MsDescripcion,MsEstado,MsAlto,MsAncho,MsProfundo,TiMId) values (msNombre,msImagen, msDescripcion,msEstado,msAlto,msAncho,msProfundo,TiMId);
 end $$
 delimiter $$
 
-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure materialsecoMo(in marId int(11),in marNombre varchar(45), in marPortada mediumtext,in marEstado tinyint(1),in armId int(11))
begin
update materialseco SET MsNombre=msNombre, MsImagen=msImagen,MsDescripcion=msDescripcion, MsEstado=msEstado,MsAlto=msAlto,MsAncho=msAncho,MsProfundo=msProfundo where MsId=msId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure materialsecoLi ()
begin
select *
from materialseco as ma inner join armado as a on ma.ArmId = a.ArmId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure materialsecoCo (in msId INT)
begin
select *
from materialseco as m inner join armado as a on ma.ArmId = a.ArmId;end $$
delimiter $$
-- ----------
-------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure materialsecoEl (in msId INT)
begin
delete from materialseco where MsId = msId;
end $$
delimiter $$



-- -----------------------------------------------------
-- Procedimientos LotusProject Tabla menu
-- Insertar
-- --------- 

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
create procedure menuLi ()
begin
select *
from menu as me inner join marcacion as mar on me.MarId = mar.MarId;
end $$
delimiter $$

-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure menuCo (in menuId INT)
begin
select *
from menu as me inner join marcacion as mar on me.MarId = mar.MarId;
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
-- Procedimientos LotusProject Tabla parametros
-- Insertar
-- --------- 
--------------------------------------------

delimiter $$
 create procedure parametrosIn(in pNombre varchar(45), in pEstado tinyint(1))
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
select ParId,ParNombre,ParEstado from parametros;
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
-- Procedimientos LotusProject Tabla paso
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
create procedure pasoMo(in peId int(11),in peNombre varchar(45), in peModulo varchar(45), in peDescripcion mediumtext, in PerIco varchar(20), in PerUrl varchar(100), in PerEstado tinyint(1) )
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
select *
from paso as ps inner join armado as ar on ps.ArmId = ar.ArmId;
end $$
delimiter $$
-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------
delimiter $$
create procedure pasoCo (in psId INT)
begin
select *
from paso as ps inner join armado as ar on ps.ArmId = ar.ArmId;
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
-- Procedimientos LotusProject Tabla poscosecha
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure poscosechaIn (in psNombre varchar(45), in psDireccion varchar(90), in psTelefono varchar(10), in psEstado tinyint(1))
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
select PosId,PosNombre,PosDireccion,PosTelefono,PosEstado from poscosecha;
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
-- Procedimientos LotusProject Tabla preliminar
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
select *
from preliminar as pr inner join poscosecha as ps on pr.PosId = ps.PosId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure preliminarCo (in prId INT)
begin
select *
from preliminar as pr inner join poscosecha as ps on pr.PosId = ps.PosId;
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
-- Procedimientos LotusProject Tabla productos
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure productosIn (in prNombre varchar(45), in prImagen varchar(255), in prEstado tinyint(1),in maeId int(11))
begin
insert into productos (ProNombre,ProImagen,ProEstado,MaeId) values (prNombre,prImagen,prEstado,maeId);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure productosMo (in prId int(11),in prNombre varchar(45), in prImagen varchar(255), in prEstado tinyint(1),in maeId int(11))
begin
update productos SET ProNombre=prNombre, ProImagen=prImagen, ProEstado=prEstado,MaeId=maeId where ProId=prId;
end $$
delimiter $$
 -- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure productosLi ()
begin
SELECT m.MaeId, m.MaeNombre, p.ProId, p.ProNombre, p.ProImagen, p.ProEstado, p.MaeId
FROM
productos AS p
INNER JOIN maestro AS m ON p.MaeId = m.MaeId
ORDER BY
p.ProNombre ASC;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure productosCo (in prId INT)
begin
select p.ProId,p.ProNombre,p.ProImagen,p.ProEstado,m.MaeId,m.MaeNombre
from productos as p 
inner join maestro as m on p.MaeId = m.MaeId;
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
-- Procedimientos LotusProject Tabla tipoms
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
select TiMId,TiMNombre,TiMDescripcion from tipoms;
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
create procedure tipomsEl (in tiMId INT)
begin
delete from tipoms where  TiMId = tiMId;
end $$
delimiter $$
variedad



 -- -----------------------------------------------------
-- Procedimientos LotusProject Tabla variedad
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure variedadIn (in varNombre varchar(45), in varEstado tinyint(1),in proId int(11),in varImagen varchar(45),in varColor varchar(15))
begin
insert into variedad (VarNombre,VarEstado,ProId,VarImagen,VarColor) values (varNombre,varEstado,proId,varImagen,varColor);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure variedadMo (in varId int(11),in varNombre varchar(45), in varEstado tinyint(1),in ProId int(11),in VarImagen varchar(45),in VarColor varchar(15))
begin
update variedad SET VarId=varId, VarNombre=varNombre,VarEstado=varEstado,ProId=proId,VarImagen=varImagen,VarColor=varColor where VarId=varId;
end $$
delimiter $$
-- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure variedadLi ()
begin
select VarId,VarNombre,VarEstado,ProId,VarImagen,VarColor from variedad;
end $$
delimiter $$
-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure variedadCo (in tId INT)
begin
select VarId,VarNombre,VarEstado,ProId,VarImagen,VarColor from variedad where VarId = varId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Eliminar
-- -----------------------------------------------------

delimiter $$
create procedure variedadEl (in vId INT)
begin
delete from variedad where  VarId = rId;
end $$
delimiter $$


