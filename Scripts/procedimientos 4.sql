-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla armado
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure armadoIn (in aNombre varchar(45), in aDescripcion varchar(45),in aEstado tinyint(1))
begin
insert into armado (ArmNombre,ArmDescricion,ArmEstado) values (aNombre,aDescripcion,aEstado);
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
-- Procedimientos LotusProyect Tabla fitoproducto
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
-- Procedimientos LotusProyect Tabla fitosanidad
-- Insertar
-- ---------
--------------------------------------------

delimiter $$
create procedure fitosanidadIn (in fNombre varchar(45), in fDescripcion varchar(45),in fTipo enum ('Plaga','Enfermedad'), in fImagen varchar (45),in fEstado tinyint(1))
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
-- Procedimientos LotusProyect Tabla grados
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
-- Procedimientos LotusProyect Tabla linea
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
-- Procedimientos LotusProyect Tabla maestro
-- Insertar
-- ---------

--------------------------------------------

delimiter $$
create procedure maestroIn(in mNombre varchar(45), in mDescripcion varchar(255))
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
-- Procedimientos LotusProyect Tabla marcacion
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
-- Procedimientos LotusProyect Tabla materialseco
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
-- Procedimientos LotusProyect Tabla menu
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
-- Procedimientos LotusProyect Tabla parametros
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
-- Procedimientos LotusProyect Tabla poscosecha
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
-- Procedimientos LotusProyect Tabla productos
-- Insertar
-- -----------------------------------------------------

delimiter $$
create procedure productosIn (in prNombre varchar(45), in prEstado tinyint(1),in maeId int(11))
begin
insert into productos (ProNombre,ProEstado,MaeId) values (prNombre,prEstado,maeId);
end $$
delimiter $$

-- -----------------------------------------------------
-- Modificar
-- -----------------------------------------------------

delimiter $$
create procedure productosMo (in prId int(11),in prNombre varchar(45), in prEstado tinyint(1),in maeId int(11))
begin
update productos SET ProNombre=prNombre, ProEstado=prEstado,MaeId=maeId where ProId=prId;
end $$
delimiter $$
 -- -----------------------------------------------------
-- Listar todos
-- ----------------------------------------- ------------

delimiter $$
create procedure productosLi ()
begin
select *
from productos as pro inner join maestro as mae on pro.MaeId = mae.MaeId;
end $$
delimiter $$

-- -----------------------------------------------------
-- Consultar x id
-- -----------------------------------------------------

delimiter $$
create procedure productosCo (in prId INT)
begin
select *
from productos as pro inner join maestro as mae on pro.MaeId = mae.MaeId;
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
-- Procedimientos LotusProyect Tabla variedad
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












