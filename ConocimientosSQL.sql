Create database Prueba
use prueba;

create table productos(
  idProducto int identity(1,1) primary key,
  nombre varchar(40) not null,
  precio decimal(16,2) not null
);
create table ventas(
  idVenta int identity(1,1) primary key,
  idProducto int not null,
  cantidad int not null,
  foreign key (idProducto) references productos(idProducto)
);

/*Inserción de datos*/

insert into productos(nombre,precio) values ('LAPTOP', 3000),
('PC', 4000),('MOUSE',100),('TECLADO',150), ('MONITOR',2000), 
('MICROFONO',350),('AUDIFONOS',450);

insert into ventas(idProducto, cantidad) values(5,8),(1,15),(6,13),
(6,4),(2,3),(5,1),(4,5),(2,5),(6,2),(1,8);


/*Consultas necesarias*/

/*Productos con venta*/

select distinct p.idProducto, p.nombre,p.precio
from productos p
inner join ventas v on p.idProducto = v.idProducto;

/*Productos con ventas y cantidad total de venta*/
select p.idProducto, p.nombre,p.precio,
SUM(v.cantidad) as CantidadTotalVendida
from productos p
inner join Ventas v on p.idProducto = v.idProducto
group by p.idProducto, p.nombre, p.precio;

/*Productos y suma total por producto*/
select p.idProducto, p.nombre, p.precio, ISNULL(SUM(v.cantidad * p.precio),0) as TotalVendido
from productos p
left join ventas v on p.idProducto = v.idProducto
group by p.idProducto, p.nombre, p.precio;