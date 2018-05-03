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
select RolNombre,RolDescripcion,RolEstado from rol where RolId = rId;
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
