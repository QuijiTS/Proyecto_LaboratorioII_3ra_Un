CREATE DATABASE discos;
USE discos;

CREATE TABLE inventario(
    codigo VARCHAR(5),
    nombre VARCHAR(20),
    duracion TIME,
    cantidadCanciones INT NOT NULL,
    autor VARCHAR(20),
    existencias INT NOT NULL,
    precio INT NOT NULL,
    PRIMARY KEY(codigo)
);

CREATE TABLE vendedor(
    id VARCHAR(5),
    nombre VARCHAR(25),
    numeroVentas INT NOT NULL,
    agnoNacimiento INT NOT NULL,
    salario INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE cliente(
    cui VARCHAR(13),
    nombre VARCHAR(25),
    PRIMARY KEY(cui)
);

CREATE TABLE ventas(
    codigo VARCHAR(5),
    codigoProducto VARCHAR(5),
    idVendedor VARCHAR(5),
    cuiCliente VARCHAR(13),
    PRIMARY KEY(codigo),
    FOREIGN KEY (codigoProducto)
REFERENCES inventario(codigo),
    FOREIGN KEY (idVendedor)
REFERENCES vendedor(id),
    FOREIGN KEY (cuiCliente)
REFERENCES cliente(cui)
);

CREATE TABLE factura(
    codigo VARCHAR(5),
    cuiCliente VARCHAR(13),
    idVendedor VARCHAR(5),
    codigoProducto VARCHAR(5),
    codigoVenta VARCHAR(5),
    PRIMARY KEY (codigo),
    FOREIGN KEY(cuiCliente)
REFERENCES cliente(cui),
    FOREIGN KEY(idVendedor)
REFERENCES vendedor(id),
    FOREIGN KEY(codigoProducto)
REFERENCES inventario(codigo),
    FOREIGN KEY(codigoVenta)
REFERENCES ventas(codigo)
);


INSERT INTO inventario VALUES
("D0001","Evolve",'004012',11,"Imagine Dragons",32,650),
("D0002","Night Visions",'004010',11,"Imagine Dragons",19,580),
("D0003","Origins",'004010',12,"Imagine Dragons",28,480),
("D0004","Smoke + Mirrors",'005055',13,"Imagine Dragons",30,350);

INSERT INTO vendedor VALUES
("T0001","Luis Alfonso",16,1995,5000),
("T0002","Maria Aguirre",18,1993,5000);

INSERT INTO cliente VALUES
("1657892102101","Luisa Juarez"),
("6875693489635","Fernando Suarez");

INSERT INTO ventas VALUES
("V0001","D0001","T0001","1657892102101"),
("V0002","D0003","T0002","6875693489635");

INSERT INTO factura VALUES
("F0001","1657892102101","T0001","D0001","V0001"),
("F0002","6875693489635","T0002","D0002","V0002");

SELECT * FROM inventario;

SELECT * FROM vendedor;

SELECT * FROM cliente;

SELECT * FROM ventas;

SELECT * FROM factura;

Drop database discos;