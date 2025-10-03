CREATE DATABASE marketplaces;
drop database marketplaces;
use hotel;
CREATE TABLE evento (
evento_id INT NOT NULL,
nombre VARCHAR(200) NOT NULL,
fecha_inicio DATE NOT NULL CONSTRAINT df_evento_fecha_inicio DEFAULT (GETDATE()),
cantidad_vendida INT NOT NULL,
tipo_evento_id INT NOT NULL,

);

CREATE TABLE Productos (
    IdProducto INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Precio DECIMAL(10,2)
);


INSERT INTO Productos (IdProducto, Nombre, Precio) VALUES
(1, 'Teclado', 100.00),
(2, 'Mouse', 50.00),
(3, 'Monitor', 300.00),
(4, 'Silla', 300.00),   -- mismo precio que el Monitor (para probar WITH TIES)
(5, 'Parlante', 150.00),
(6, 'Auriculares', 150.00), -- mismo precio que Parlante
(7, 'Impresora', 200.00),
(8, 'Notebook', 800.00),
(9, 'Escritorio', 250.00),
(10,'Webcam', 80.00);

select top 20 percent with ties * from Productos
order by precio desc

CREATE TABLE Ventas (
    IdVenta INT PRIMARY KEY,
    Cliente VARCHAR(50),
    Producto VARCHAR(50),
    Categoria VARCHAR(50),
    Monto DECIMAL(10,2),
    Fecha DATE
);
use hotel
INSERT INTO Ventas(idVenta, cliente, producto,categoria,monto,fecha) VALUES
(1, 'Ana',   'Laptop',   'Electrónica', 1000, '2025-01-10'),
(2, 'Ana',   'Mouse',    'Electrónica',   50, '2025-01-10'),
(3, 'Ana',   'Laptop',   'Electrónica', 1200, '2025-02-05'),
(4, 'Luis',  'Laptop',   'Electrónica',  900, '2025-02-07'),
(5, 'Luis',  'Mouse',    'Electrónica',   40, '2025-02-07'),
(6, 'Ana',   'Mouse',    'Electrónica',   30, '2025-03-01'),
(7, 'Marta', 'Silla',    'Muebles',      200, '2025-03-03'),
(8, 'Marta', 'Mesa',     'Muebles',      500, '2025-03-05'),
(9, 'Pedro', 'Laptop',   'Electrónica', 1100, '2025-03-10'),
(10,'Pedro', 'Celular',  'Electrónica',  800, '2025-03-11'),
(11,'Pedro', 'Silla',    'Muebles',      250, '2025-03-12'),
(12,'Ana',   'Celular',  'Electrónica',  900, '2025-03-15'),
(13,'Luis',  'Mesa',     'Muebles',      400, '2025-03-20'),
(14,'Marta', 'Celular',  'Electrónica',  700, '2025-03-21'),
(15,'Pedro', 'Mouse',    'Electrónica',   60, '2025-03-22');


select top 4 * from ventas
order by categoria desc, monto 

select top 7 with ties * from ventas
select * from ventas
order by categoria asc, cliente ;

group by categoria
select  * from ventas;
select categoria, sum(cantidad), sum(precio) from ventas
group by categoria
having sum(cantidad) > 6


select categoria, cantidad
from ventas
group by categoria








































































-- Tabla vendedor
CREATE TABLE vendedor
(
  cuit_vendedor INT NOT NULL,
  nombre_apellido VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  email VARCHAR(100),
  CONSTRAINT PK_vendedor PRIMARY KEY (cuit_vendedor),
  CONSTRAINT UQ_vendedor_email UNIQUE (email),
  CONSTRAINT CK_vendedor_edad CHECK (DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) >= 18)
);

-- Tabla categoria
CREATE TABLE categoria
(
  id_categoria INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT PK_categoria PRIMARY KEY (id_categoria)
);

-- Tabla material
CREATE TABLE material
(
  id_material INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT PK_material PRIMARY KEY (id_material)
);

-- Tabla metodo_pago
CREATE TABLE metodo_pago
(
  id_pago INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT PK_metodo_pago PRIMARY KEY (id_pago)
);

-- Tabla ciudad
CREATE TABLE ciudad
(
  id_ciudad INT NOT NULL,
  nombre VARCHAR(200) NOT NULL,
  CONSTRAINT PK_ciudad PRIMARY KEY (id_ciudad)
);

-- Tabla producto
CREATE TABLE producto
(
  id_producto INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(200),
  precio FLOAT NOT NULL,
  status_publicacion VARCHAR(10) NOT NULL,
  fecha_publicación DATE CONSTRAINT DF_producto_fecha_publicacion DEFAULT GETDATE(),
  id_categoria INT NOT NULL,
  CONSTRAINT PK_producto PRIMARY KEY (id_producto),
  CONSTRAINT FK_producto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
  CONSTRAINT CK_producto_status_publicacion CHECK (status_publicacion IN ('activa', 'pausada'))
);

-- Tabla cliente
CREATE TABLE cliente
(
  dni INT NOT NULL ,
  nombre_apellido VARCHAR(100) NOT NULL,
  domicilio VARCHAR(200) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefono VARCHAR(50),
  id_ciudad INT NOT NULL,
  CONSTRAINT PK_cliente PRIMARY KEY (dni),
  CONSTRAINT FK_cliente_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad),
  CONSTRAINT UQ_cliente_email UNIQUE (email),
  CONSTRAINT UQ_cliente_telefono UNIQUE (telefono)


  CONSTRAINT ck_precio CHECK(preecio 0,),
  CONSTRAINT ck_valores CHECK(lista IN ('HOLA', 'ADIOs') ),

);

-- Tabla venta
CREATE TABLE venta
(
  nro_venta INT NOT NULL,
  nro_factura INT NOT NULL,
  fecha_venta DATE NOT NULL,
  cuit_vendedor INT NOT NULL,
  dni INT NOT NULL,
  CONSTRAINT PK_venta PRIMARY KEY (nro_venta),
  CONSTRAINT FK_venta_vendedor FOREIGN KEY (cuit_vendedor) REFERENCES vendedor(cuit_vendedor),
  CONSTRAINT FK_venta_cliente FOREIGN KEY (dni) REFERENCES cliente(dni)
);

-- Tabla venta_detalle
CREATE TABLE venta_detalle
(
  cantidad INT NOT NULL,
  precio_venta FLOAT NOT NULL,
  nro_venta INT NOT NULL,
  id_producto INT NOT NULL,
  CONSTRAINT PK_venta_detalle PRIMARY KEY (nro_venta, id_producto),
  CONSTRAINT FK_venta_detalle_venta FOREIGN KEY (nro_venta) REFERENCES venta(nro_venta),
  CONSTRAINT FK_venta_detalle_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla resena
CREATE TABLE resena
(
  id_resena INT NOT NULL,
  calificacion INT NOT NULL,
  comentario VARCHAR(200) NOT NULL,
  nro_venta INT NOT NULL,
  id_producto INT NOT NULL,
  CONSTRAINT PK_resena PRIMARY KEY (id_resena, nro_venta, id_producto),
  CONSTRAINT FK_resena_venta_detalle FOREIGN KEY (nro_venta, id_producto) REFERENCES venta_detalle(nro_venta, id_producto),
  CONSTRAINT CK_resena_calificacion CHECK (calificacion BETWEEN 1 AND 10)
);

-- Tabla producto_material
CREATE TABLE producto_material
(
  porcentaje INT NOT NULL,
  id_producto INT NOT NULL,
  id_material INT NOT NULL,
  CONSTRAINT PK_producto_material PRIMARY KEY (id_producto, id_material),
  CONSTRAINT FK_producto_material_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  CONSTRAINT FK_producto_material_material FOREIGN KEY (id_material) REFERENCES material(id_material)
);

-- Tabla pago
CREATE TABLE pago
(
  importe FLOAT NOT NULL,
  nro_venta INT NOT NULL,
  id_pago INT NOT NULL,
  CONSTRAINT PK_pago PRIMARY KEY (nro_venta, id_pago),
  CONSTRAINT FK_pago_venta FOREIGN KEY (nro_venta) REFERENCES venta(nro_venta),
  CONSTRAINT FK_pago_metodo_pago FOREIGN KEY (id_pago) REFERENCES metodo_pago(id_pago)
);








CREATE DATABASE eventos_musicales;
USE eventos_musicales;

CREATE TABLE genero_musical
(
  id_genero INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT pk_genero_musical PRIMARY KEY (id_genero)
);

CREATE TABLE continente
(
  id_continete INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
   CONSTRAINT pk_continente PRIMARY KEY (id_continete)
);

CREATE TABLE pais_origen
(
  id_pais INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  id_continete INT NOT NULL,
  CONSTRAINT pk_pais_origen PRIMARY KEY (id_pais, id_continete),
  CONSTRAINT pk_pais_origen_continente FOREIGN KEY (id_continete) REFERENCES continente(id_continete),
  CONSTRAINT uq_pais_origen_nombre UNIQUE (nombre)
);

CREATE TABLE artista
(
  id_artista INT NOT NULL,
  nombre_artistico VARCHAR(100) NOT NULL,
  cant_intgrantes INT NOT NULL,
  id_genero INT NOT NULL,
  id_pais INT NOT NULL,
  id_continete INT NOT NULL,
  CONSTRAINT pk_artista PRIMARY KEY (id_artista),
  CONSTRAINT pk_artista_genero_musical  FOREIGN KEY (id_genero) REFERENCES genero_musical(id_genero),
  CONSTRAINT pk_artista_pais_origen FOREIGN KEY (id_pais, id_continete) REFERENCES pais_origen(id_pais, id_continete),
  CONSTRAINT ck_artista_cant_intgrantes CHECK (cant_intgrantes 1)
);

CREATE TABLE lugar
(
  id_lugar INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(200) NOT NULL,
  capacidad_max INT NOT NULL,
  CONSTRAINT pk_lugar PRIMARY KEY (id_lugar)
);

CREATE TABLE evento
(
  id_evento INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  cant_entradas_vendidas INT NOT NULL,
  fecha_inicio DATE CONSTRAINT df_evento_fecha_inicio DEFAULT GETDATE(),
  fecha_fin DATE NOT NULL,
  id_lugar INT NOT NULL,
  CONSTRAINT pk_evento PRIMARY KEY (id_evento),
  CONSTRAINT pk_evento_lugar FOREIGN KEY (id_lugar) REFERENCES lugar(id_lugar)
  CONSTRAINT ck_eventos_cant_entradas_vendidas  CHECK (cant_entradas_vendidas  0)
);

CREATE TABLE actuaciones
(
  hora_inicio DATE NOT NULL,
  duracion INT NOT NULL,
  id_evento INT NOT NULL,
  id_artista INT NOT NULL,
  CONSTRAINT actuaciones PRIMARY KEY (id_evento, id_artista),
  CONSTRAINT actuaciones_evento  FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
  CONSTRAINT actuaciones_artista FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);