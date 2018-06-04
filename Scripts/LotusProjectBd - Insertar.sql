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

call LotusProject.usuarioIn('1070949', 'Alexander', 'Moreno', 'almoreno', '1234', '2315', '301463', 'almoreno@eliteflower.com','M' ,'img/Usuario/almoreno.jpg',1, 1);
call LotusProject.usuarioIn('1075', 'Neissy', 'Medina', 'nmedina', '1234', '2315', '301463', 'nmedina@eliteflower.com','F', 'img/Usuario/Usuaria.png',1, 1);
call LotusProject.usuarioIn('1073', 'Erika', 'Guerrero', 'eguerrero', '1234', '2315', '301463', 'eguerrero@eliteflower.com','F', 'img/Usuario/Usuaria.png',1, 1);
call LotusProject.usuarioIn('1075515', 'Camilo', 'Lara', 'clara', '1234', '2315', '301463', 'clara@eliteflower.com','M', 'img/Usuario/Usuario.png',1, 1);
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
call LotusProject.permisoIn('AsignaPer', 'Usuario', 'Permisos de usuario', 'permiso.jsp', 'developer_board', 1);
call LotusProject.permisoIn('Postcosecha', 'Poscosecha', 'Permisos de poscosecha', 'poscosecha.jsp', 'business', 1);
call LotusProject.permisoIn('Cliente', 'Cliente', 'Permisos de cliente', 'cliente.jsp', 'local_mall', 1);
call LotusProject.permisoIn('Producto', 'Producto', 'Permisos de producto', 'producto.jsp', 'local_florist', 1);
call LotusProject.permisoIn('Marcación', 'Marcación', 'Permisos de marcación', 'marcacion.jsp', 'local_offer', 1);
call LotusProject.permisoIn('Armado', 'Armado', 'Permisos de armado', 'armado.jsp', 'extension', 1);
call LotusProject.permisoIn('Parametro', 'Producto', 'Permisos de parametros', 'parametros.jsp', 'tune', 1);
call LotusProject.permisoIn('Variedad', 'Producto', 'Permisos de variedad', 'variedad.jsp', 'filter_vintage', 1);
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
call LotusProject.AsgPerIn(1, 9, 1, 1, 1, 1);
call LotusProject.AsgPerIn(1, 10, 1, 1, 1, 1);
call LotusProject.AsgPerIn(1, 11, 1, 1, 1, 1);


call LotusProject.AsgPerIn(2, 1, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 2, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 3, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 4, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 5, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 6, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 7, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 8, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 9, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 10, 1, 1, 1, 1);
call LotusProject.AsgPerIn(2, 11, 1, 1, 1, 1);

call LotusProject.AsgPerIn(3, 1, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 2, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 3, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 4, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 5, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 6, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 7, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 8, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 9, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 10, 1, 1, 1, 1);
call LotusProject.AsgPerIn(3, 11, 1, 1, 1, 1);

call LotusProject.AsgPerIn(4, 1, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 2, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 3, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 4, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 5, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 6, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 7, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 8, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 9, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 10, 1, 1, 1, 1);
call LotusProject.AsgPerIn(4, 11, 1, 1, 1, 1);

call LotusProject.AsgPerIn(5, 1, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 2, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 3, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 4, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 5, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 6, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 7, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 8, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 9, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 10, 1, 1, 1, 1);
call LotusProject.AsgPerIn(5, 11, 1, 1, 1, 1);

call LotusProject.AsgPerIn(6, 1, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 2, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 3, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 4, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 5, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 6, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 7, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 8, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 9, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 10, 1, 1, 1, 1);
call LotusProject.AsgPerIn(6, 11, 1, 1, 1, 1);

-- call LotusProject.AsgPerLi(1);
-- call LotusProject.AsgPerMo(2, 1, 0, 0, 0, 0);
-- call LotusProject.AsgPerCo(1, 1);
-- call LotusProject.AsgPerSession(1070949);
-- call LotusProject.AsgPerEl(3, 6);

-- -----------------------------------------------------

call LotusProject.maestroIn('Green', 'Agrupa los productos verdes, sin flor ');
call LotusProject.maestroIn('Alstroemeria', 'Agrupa los producto familiares de la alstroemeria');
call LotusProject.maestroIn('Pompom', 'Agrupa los producto familiares del pompon sin desbotonar');
call LotusProject.maestroIn('Arandano', 'Agrupa los producto familiares del arandano');
call LotusProject.maestroIn('Lirios', 'Agrupa los producto familiares del lirio ');
call LotusProject.maestroIn('Fillers', 'Agrupa los producto de flor pequeña, utilizados para decoracion de productos principales');
call LotusProject.maestroIn('Diver', 'Agrupa los producto de siembras menores que se prestan para elaborcion de ramos solidos');
call LotusProject.maestroIn('Carnation', 'Agrupa los producto familiares del clavel');
call LotusProject.maestroIn('Disbud', 'Agrupa los producto familiares del pompon desbotonados');
call LotusProject.maestroIn('Gerberas', 'Agrupa los producto familiares de la gerbera');
call LotusProject.maestroIn('Roses', 'Agrupa los producto familiares de la rosa estandar');

call LotusProject.poscosechaIn('A. Carnations', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('A. Las Palmas', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('A. Las Palmas Alstroemeria', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('Bqt - Santamaria', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('El Morado', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('El Morado Alstroemeria', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('El Rosal', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('Guacari', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('Las Margaritas', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('Normandia', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('Postcosecha Fantasy', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('Postcosecha San Valentino', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('Santamaria', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('Valdaya', 'Km x ', '1234', 1);
call LotusProject.poscosechaIn('Vista - Elite', 'Km x ', '1234', 1);


call LotusProject.productoIn('Acacia','img/Maestro/Producto/acacia.png',1,1);
call LotusProject.productoIn('Adenanthus','img/Maestro/Producto/adenanthus.png',1,1);
call LotusProject.productoIn('Agonis','img/Maestro/Producto/agonis.png',1,1);
call LotusProject.productoIn('Alstroemeria','img/Maestro/Producto/alstroemeria.png',1,2);
call LotusProject.productoIn('Anemonas','img/Maestro/Producto/anemonas.png',1,3);
call LotusProject.productoIn('Aralia','img/Maestro/Producto/aralia.png',1,1);
call LotusProject.productoIn('Arandano','img/Maestro/Producto/arandano.png',1,4);
call LotusProject.productoIn('Asiatic','img/Maestro/Producto/asiatic.png',1,5);
call LotusProject.productoIn('Aster','img/Maestro/Producto/aster.png',1,6);
call LotusProject.productoIn('Brassicas','img/Maestro/Producto/brassicas.png',1,7);
call LotusProject.productoIn('Button','img/Maestro/Producto/button.png',1,3);
call LotusProject.productoIn('Callas','img/Maestro/Producto/callas.png',1,7);
call LotusProject.productoIn('Carnation','img/Maestro/Producto/carnation.png',1,8);
call LotusProject.productoIn('Cocculos','img/Maestro/Producto/cocculos.png',1,1);
call LotusProject.productoIn('Craspedia','img/Maestro/Producto/craspedia.png',1,7);
call LotusProject.productoIn('Cremon','img/Maestro/Producto/cremon.png',1,9);
call LotusProject.productoIn('Cupressus','img/Maestro/Producto/cupressus.png',1,1);
call LotusProject.productoIn('Cushion','img/Maestro/Producto/cushion.png',1,3);
call LotusProject.productoIn('Cypres','img/Maestro/Producto/cypres.png',1,1);
call LotusProject.productoIn('Daisy','img/Maestro/Producto/daisy.png',1,3);
call LotusProject.productoIn('Delphinium','img/Maestro/Producto/delphinium.png',1,7);
call LotusProject.productoIn('Dianthus','img/Maestro/Producto/dianthus.png',1,6);
call LotusProject.productoIn('Eryngium','img/Maestro/Producto/eryngium.png',1,6);
call LotusProject.productoIn('Eucaliptus','img/Maestro/Producto/eucaliptus.png',1,1);
call LotusProject.productoIn('Euonymous','img/Maestro/Producto/euonymous.png',1,1);
call LotusProject.productoIn('Garden Roses','img/Maestro/Producto/garden roses.png',1,11);
call LotusProject.productoIn('Gerbera','img/Maestro/Producto/gerbera.png',1,10);
call LotusProject.productoIn('Gerrondo','img/Maestro/Producto/gerrondo.png',1,10);
call LotusProject.productoIn('Grevilleas','img/Maestro/Producto/grevilleas.png',1,1);
call LotusProject.productoIn('Gypsophila','img/Maestro/Producto/gypsophila.png',1,6);
call LotusProject.productoIn('Hydrangea','img/Maestro/Producto/hydrangea.png',1,7);
call LotusProject.productoIn('Kalanchoe','img/Maestro/Producto/kalanchoe.png',1,7);
call LotusProject.productoIn('Leucadendron','img/Maestro/Producto/leucadendron.png',1,1);
call LotusProject.productoIn('Ligustrum','img/Maestro/Producto/ligustrum.png',1,1);
call LotusProject.productoIn('Lilly Grass','img/Maestro/Producto/lilly grass.png',1,1);
call LotusProject.productoIn('Limonium','img/Maestro/Producto/limonium.png',1,6);
call LotusProject.productoIn('Lirios','img/Maestro/Producto/lirios.png',1,5);
call LotusProject.productoIn('Matsumoto','img/Maestro/Producto/matsumoto.png',1,7);
call LotusProject.productoIn('Micro','img/Maestro/Producto/micro.png',1,3);
call LotusProject.productoIn('Gerbera Mini','img/Maestro/Producto/gerbera mini.png',1,10);
call LotusProject.productoIn('Minicarnation','img/Maestro/Producto/minicarnation.png',1,8);
call LotusProject.productoIn('Novelty','img/Maestro/Producto/novelty.png',1,3);
call LotusProject.productoIn('Oriental','img/Maestro/Producto/oriental.png',1,5);
call LotusProject.productoIn('Photinia','img/Maestro/Producto/photinia.png',1,1);
call LotusProject.productoIn('Gerbera Piccolin','img/Maestro/Producto/gerbera piccolin.png',1,10);
call LotusProject.productoIn('Pompon','img/Maestro/Producto/pompon.png',1,3);
call LotusProject.productoIn('Roses','img/Maestro/Producto/roses.png',1,11);
call LotusProject.productoIn('Ruscus','img/Maestro/Producto/ruscus.png',1,1);
call LotusProject.productoIn('Santini','img/Maestro/Producto/santini.png',1,3);
call LotusProject.productoIn('Scabiosa','img/Maestro/Producto/scabiosa.png',1,7);
call LotusProject.productoIn('Solidago','img/Maestro/Producto/solidago.png',1,6);
call LotusProject.productoIn('Gerbera Spider','img/Maestro/Producto/gerbera spider.png',1,10);
call LotusProject.productoIn('Roses Spray','img/Maestro/Producto/roses spray.png',1,11);
call LotusProject.productoIn('Stock','img/Maestro/Producto/stock.png',1,6);
call LotusProject.productoIn('Spider','img/Maestro/Producto/spider.png',1,3);
call LotusProject.productoIn('Sunflower','img/Maestro/Producto/sunflower.png',1,7);
call LotusProject.productoIn('Trachelium','img/Maestro/Producto/trachelium.png',1,7);
call LotusProject.productoIn('Viburnum','img/Maestro/Producto/viburnum.png',1,1);

call LotusProject.armadoIn('Bloomstar Rainbow', 'Armado de 24 tallos', 1);

call LotusProject.pasoIn(1, 'Hacer y hacer 1', 'img/Armado/Bloomstar Rainbow con lamina/1ro.png', 1);
call LotusProject.pasoIn(2, 'Hacer y hacer 2', 'img/Armado/Bloomstar Rainbow con lamina/2do.png', 1);
call LotusProject.pasoIn(3,'Hacer y hacer! 3','img/Armado/Bloomstar Rainbow con lamina/3ro.png',1);
call LotusProject.pasoIn(4,'Hacer y hacer! 4','img/Armado/Bloomstar Rainbow con lamina/4to.png',1);
call LotusProject.pasoIn(5,'Hacer y hacer! 5','img/Armado/Bloomstar Rainbow con lamina/5to.png',1);
call LotusProject.pasoIn(6,'Hacer y hacer! 6','img/Armado/Bloomstar Rainbow con lamina/6to.png',1);
call LotusProject.pasoIn(7,'Hacer y hacer! 7','img/Armado/Bloomstar Rainbow con lamina/7mo.png',1);
call LotusProject.pasoIn(8,'Hacer y hacer! 8','img/Armado/Bloomstar Rainbow con lamina/8vo.png',1);
call LotusProject.pasoIn(9,'Hacer y hacer! 9','img/Armado/Bloomstar Rainbow con lamina/9no.png',1);
call LotusProject.pasoIn(10,'Hacer y hacer! 10','img/Armado/Bloomstar Rainbow con lamina/10mo.png',1);
call LotusProject.pasoIn(11,'Hacer y hacer! 11','img/Armado/Bloomstar Rainbow con lamina/11vo.png',1);
call LotusProject.pasoIn(12,'Hacer y hacer! 12','img/Armado/Bloomstar Rainbow con lamina/12vo.png',1);
call LotusProject.pasoIn(13,'Hacer y hacer! 13','img/Armado/Bloomstar Rainbow con lamina/13vo.png',1);
call LotusProject.pasoIn(14,'Hacer y hacer! 14','img/Armado/Bloomstar Rainbow con lamina/14vo.png',1);
call LotusProject.pasoIn(15,'Hacer y hacer! 15','img/Armado/Bloomstar Rainbow con lamina/15vo.png',1);
call LotusProject.pasoIn(16,'Hacer y hacer! 16','img/Armado/Bloomstar Rainbow con lamina/16vo.png',1);
call LotusProject.pasoIn(17,'Hacer y hacer! 17','img/Armado/Bloomstar Rainbow con lamina/17vo.png',1);
call LotusProject.pasoIn(18,'Hacer y hacer! 18','img/Armado/Bloomstar Rainbow con lamina/18vo.png',1);
call LotusProject.pasoIn(19,'Hacer y hacer! 19','img/Armado/Bloomstar Rainbow con lamina/19vo.png',1);
call LotusProject.pasoIn(20,'Hacer y hacer! 20','img/Armado/Bloomstar Rainbow con lamina/20vo.png',1);
call LotusProject.pasoIn(21,'Hacer y hacer! 21','img/Armado/Bloomstar Rainbow con lamina/21vo.png',1);
call LotusProject.pasoIn(22,'Hacer y hacer! 22','img/Armado/Bloomstar Rainbow con lamina/22vo.png',1);
call LotusProject.pasoIn(23,'Hacer y hacer! 23','img/Armado/Bloomstar Rainbow con lamina/23vo.png',1);



-- Procedimientos LotusProject Tabla grados 
call lotusproject.armadoIn('rosa', 'amarilla', 1);
-- call lotusproject.armadoMo(1234, 'rosa', 'verde', 1);
-- call lotusproject.armadoLi();
-- call lotusproject.armadoCo(2);


-- Procedimientos LotusProject Tabla grados 
call LotusProject.gradosIn('rosa', 'roja', 1); 
-- call LotusProject.gradosMo(12345, 'rosa', 'amarillo', 1); 
-- call LotusProject.gradosLi(); 
-- call LotusProject.gradosCo(1); 
 
-- Procedimientos LotusProject Tabla linea 
call LotusProject.lineaIn(1, 1); 
-- call LotusProject.lineaMo(1, 1, 1); 
-- call LotusProject.lineaLi(); 
-- call LotusProject.lineaCo(); 
 
 
 
-- Procedimientos LotusProject Tabla maestro 
call LotusProject.maestroIn('roja', 'verde'); 
-- call LotusProject.maestroMo(123, 'rosa', 'amarilla'); 
-- call LotusProject.maestroLi(); 
-- call LotusProject.maestroCo(12); 
 
 
-- Procedimientos LotusProject Tabla marcacion 
call lotusproject.marcacionIn('rosa verde', 'abcd', 1, 1);
 -- call lotusproject.marcacionMo(1, 'rosa amarilla', 'abcd', 1, 1);
-- call lotusproject.marcacionLi();
-- call lotusproject.marcacionCo(3);
 
 
-- Procedimientos LotusProject Tabla materialseco 
call LotusProject.materialsecoIn('rosa', 'asdf', 'roja', 1, 1, 1, 1, 1); 
-- call lotusproject.materialsecoMo(1, 'rosa', 'abcd', 'verde', 1, 1, 1, 1, 1);
-- call LotusProject.materialsecoLi(); 
-- call LotusProject.materialsecoCo(2); 
 
 
-- Procedimientos LotusProject Tabla Paso 
-- call LotusProject.pasoIn(12345, 'rosa amarilla', 'abcd', 1); 
-- call LotusProject.pasoMo(1, 12345, 'rosa amarilla', 'abcd', 12345); 
-- call LotusProject.pasoLi(); 
-- call LotusProject.pasoCo(1); 
 
 
-- Procedimientos LotusProject Tabla Parametros 
call LotusProject.parametrosIn('rosita', 1); 
-- call LotusProject.parametrosMo(123, 'rosita', 1); 
-- call LotusProject.parametrosLi(); 
-- call LotusProject.parametrosCo(1); 
 
-- Procedimientos LotusProject Tabla Poscosecha 
-- call LotusProject.poscosechaIn('rosa amarilla', 'cra 21a numero 13a 64', '1234567', 1); 
-- call LotusProject.poscosechaMo(123, 'rosa amarilla', 'cra 21a numero 13a 64', '567890', 1); 
-- call LotusProject.poscosechaLi(); 
-- call LotusProject.poscosechaCo(16); 
 
-- Procedimientos LotusProject Tabla tipoms 
call LotusProject.tipomsIn('girasol', 'amarilla'); 
-- call LotusProject.tipomsMo(123, 'girasol ', 'verde'); 
-- call LotusProject.tipomsLi(); 
-- call LotusProject.tipomsCo(1); 
 
-- Procedimientos LotusProject Tabla Preliminar 
 call LotusProject.preliminarIn('2018-12-12', 'pendiente', 1); 
-- call LotusProject.preliminarMo(12345, '2018-12-12', '1', 1); 
-- call LotusProject.preliminarLi(); 
-- call LotusProject.preliminarCo(1); 