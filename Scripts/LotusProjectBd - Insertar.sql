-- -----------------------------------------------------
-- Insertar LotusProject.rol
-- -----------------------------------------------------

 call LotusProject.rolIn('Administrador', 'Encargado del negocio', 1);
 call LotusProject.rolIn('Ing. Calidad', 'Encargadito del negocio', 1);
 call LotusProject.rolIn('Ast. Calidad', 'Encargado del negocio', 1);
 call LotusProject.rolIn('Ast. Comercial', 'Encargado del negocio', 1);
 call LotusProject.rolIn('Supervisor', 'Encargado del negocio', 1);
 call LotusProject.rolIn('Estandar', 'Encargado del negocio', 1);
-- call LotusProject.rolMo(1,8 'Admin', 'El puto amo', 1);
-- call LotusProject.rolLi();
-- call LotusProject.rolEl(1);
-- call LotusProject.rolCo(1);

-- -----------------------------------------------------
-- Insertar LotusProject.Usuario
-- -----------------------------------------------------

call LotusProject.usuarioIn('1070949', 'Alexander', 'Moreno', 'almoreno', '1234', '2315', '301463', 'almoreno@eliteflower.com', 'Usuario\\almoreno.jpg',1, 1);
-- call LotusProject.usuarioMo('1070949', 'Alexander', 'Moreno', 'almoreno', '1234', '2315', '3014638753', 'almoreno@eliteflower.com', '1', 1);
-- call LotusProject.usuarioLi();
-- call LotusProject.usuarioEl('1070949');
-- call LotusProject.usuarioCo('1070949');
-- call LotusProject.usuarioLogin('1070949', '1234');

-- -----------------------------------------------------
-- Insertar LotusProject.Permisos
-- -----------------------------------------------------

call LotusProject.permisoIn('Usuario', 'Usuario', 'Permisos de usuario', 'usuario.jsp', 'face', 1);
call LotusProject.permisoIn('Rol', 'Usuario', 'Permisos de usuario', 'rol.jsp', 'assignment_ind', 1);
call LotusProject.permisoIn('Permiso', 'Usuario', 'Permisos de usuario', 'permiso.jsp', 'developer_board', 1);
call LotusProject.permisoIn('Postcosecha', 'Postcosecha', 'Permisos de postcosecha', 'postcosecha.jsp', 'business', 1);
call LotusProject.permisoIn('Cliente', 'Cliente', 'Permisos de cliente', 'cliente.jsp', 'local_mall', 1);
call LotusProject.permisoIn('Producto', 'Producto', 'Permisos de producto', 'producto.jsp', 'local_florist', 1);
call LotusProject.permisoIn('Marcación', 'Marcación', 'Permisos de marcación', 'marcacion.jsp', 'local_offer', 1);
call LotusProject.permisoIn('Armado', 'Armado', 'Permisos de armado', 'armado.jsp', 'extension', 1);
-- call LotusProject.permisoIn('Probador', 'Pruebas', 'Para probar', 'Probar.jsp', 'test', 1);
-- call LotusProject.permisoEl(7);
-- call LotusProject.permisoCo(7);
-- call LotusProject.permisoLi();

-- -----------------------------------------------------
-- Insertar LotusProject.AsgPer
-- -----------------------------------------------------

call LotusProject.AsgPerIn(1, 1, 1, 1, 1, 1);
call LotusProject.AsgPerIn(1, 2, 1, 1, 1, 1);
call LotusProject.AsgPerIn(1, 3, 1, 1, 1, 1);
call LotusProject.AsgPerIn(1, 4, 1, 1, 1, 1);
call LotusProject.AsgPerIn(1, 5, 1, 1, 1, 1);
call LotusProject.AsgPerIn(1, 6, 1, 1, 1, 1);
call LotusProject.AsgPerIn(1, 7, 1, 1, 1, 1);
call LotusProject.AsgPerIn(1, 8, 1, 1, 1, 1);

call LotusProject.AsgPerIn(2, 1, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 2, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 3, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 4, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 5, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 6, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 7, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 8, 1, 1, 1, 1);

call LotusProject.AsgPerIn(3, 1, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 2, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 3, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 4, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 5, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 6, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 7, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 8, 1, 1, 1, 1);

-- call LotusProject.AsgPerLi(1);
-- call LotusProject.AsgPerMo(2, 1, 0, 0, 0, 0);
-- call LotusProject.AsgPerCo(1, 1);
-- call LotusProject.AsgPerSession(1070949);
-- call LotusProject.AsgPerEl(3, 6);

-- -----------------------------------------------------
-- Procedimientos LotusProyect Tabla armado

call LotusProject.armadoIn('rosa', 'verde', 1);
-- call LotusProject.armadoMo(1, 'rosa', 'amarilla', 1);
-- call LotusProject.armadoLi();
-- call LotusProject.armadoEl(2);
-- call LotusProject.armadoCo(1);



-- -----------------------------------------------------


call LotusProject.marcacionIn('rosa', 'sahda', 1, 3);

-- call LotusProject.maestroMo(1, 'rosa', 'amarilla');




-- Procedimientos LotusProyect Tabla control de cambios 

call LotusProject.controldecambiosIn('rosa', 'rosita', 'aleja');
-- call LotusProject.controldecambiosLi();
-- call LotusProject.contrroldecambiosMo(4);";
-- call LotusProject.controldecambiosEl(1);
-- call LotusProject.controldecambiosCo(1);


-- Procedimientos LotusProyect Tabla FitoProducto

call LotusProject.fitoproductoIn(2); 
-- call LotusProject.fitoproductoCo(1);

