-- -----------------------------------------------------
-- Insertar LotusProyect.rol
-- -----------------------------------------------------

 call LotusProyect.rolIn('Administrador', 'Encargado del negocio', 1);
 call LotusProyect.rolIn('Ing. Calidad', 'Encargadito del negocio', 1);
 call LotusProyect.rolIn('Ast. Calidad', 'Encargado del negocio', 1);
 call LotusProyect.rolIn('Ast. Comercial', 'Encargado del negocio', 1);
 call LotusProyect.rolIn('Supervisor', 'Encargado del negocio', 1);
 call LotusProyect.rolIn('Estandar', 'Encargado del negocio', 1);
-- call LotusProyect.rolMo(1, 'Admin', 'El puto amo', 1);
call LotusProyect.rolLi();
-- call LotusProyect.rolEl(1);
-- call LotusProyect.rolCo(1);

-- -----------------------------------------------------
-- Insertar LotusProyect.Usuario
-- -----------------------------------------------------

call LotusProyect.usuarioIn('1070949', 'Alexander', 'Moreno', 'almoreno', '1234', '2315', '301463', 'almoreno@eliteflower.com', 1, 1);
-- call LotusProyect.usuarioMo('1070949', 'Alexander', 'Moreno', 'almoreno', '1234', '2315', '3014638753', 'almoreno@eliteflower.com', '1', 1);
-- call LotusProyect.usuarioLi();
-- call LotusProyect.usuarioEl('1070949');
-- call LotusProyect.usuarioCo('1070949');
-- call LotusProyect.usuarioLogin('1070949', '1234');

-- -----------------------------------------------------
-- Insertar LotusProyect.Permisos
-- -----------------------------------------------------

call LotusProyect.permisoIn('Usuario', 'Usuario', 'Permisos de usuario', 'usuario.jsp', 'face', 1);
call LotusProyect.permisoIn('Postcosecha', 'Postcosecha', 'Permisos de postcosecha', 'postcosecha.jsp', 'business', 1);
call LotusProyect.permisoIn('Cliente', 'Cliente', 'Permisos de cliente', 'cliente.jsp', 'local_mall', 1);
call LotusProyect.permisoIn('Producto', 'Producto', 'Permisos de producto', 'producto.jsp', 'local_florist', 1);
call LotusProyect.permisoIn('Marcación', 'Marcación', 'Permisos de marcación', 'marcacion.jsp', 'local_offer', 1);
call LotusProyect.permisoIn('Armado', 'Armado', 'Permisos de armado', 'armado.jsp', 'extension', 1);
-- call LotusProyect.permisoIn('Probador', 'Pruebas', 'Para probar', 'Probar.jsp', 'test', 1);
-- call LotusProyect.permisoEl(7);
-- call LotusProyect.permisoCo(7);
-- call LotusProyect.permisoLi();

-- -----------------------------------------------------
-- Insertar LotusProyect.AsgPer
-- -----------------------------------------------------

call LotusProyect.AsgPerIn(1, 1, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(1, 2, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(1, 3, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(1, 4, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(1, 5, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(1, 6, 1, 1, 1, 1);

call LotusProyect.AsgPerIn(2, 1, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(2, 2, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(2, 3, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(2, 4, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(2, 5, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(2, 6, 1, 1, 1, 1);

call LotusProyect.AsgPerIn(3, 1, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(3, 2, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(3, 3, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(3, 4, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(3, 5, 1, 1, 1, 1);
call LotusProyect.AsgPerIn(3, 6, 1, 1, 1, 1);

-- call LotusProyect.AsgPerLi(1);
-- call LotusProyect.AsgPerMo(2, 1, 0, 0, 0, 0);
-- call LotusProyect.AsgPerCo(1, 1);
-- call LotusProyect.AsgPerSession(1070949);
-- call LotusProyect.AsgPerEl(3, 6);

