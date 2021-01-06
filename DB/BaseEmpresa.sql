CREATE DATABASE IF NOT EXISTS base_empresa;

#drop table ____ para borrar tablas
#describe ____ muestra la estructura de una tabla
#Seleccionar base de datos
USE base_empresa;


drop table Proyecto_Empleado;
drop table Proyecto;
drop table EmpleadoRRHH;
drop table Calendario;
drop table EmpleadoEmpresa;
drop table DiaLibre;
drop table Empresa;


#Creamos las tablas sin relaciones
CREATE TABLE IF NOT EXISTS EmpleadoRRHH(
	IdEmpleadoRRHH INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Apellidos VARCHAR(45) NOT NULL,
    Telefono INT NOT NULL,
    Correo VARCHAR(45),
    Contrasenia VARCHAR(45),
    PRIMARY KEY(Correo)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS DiaLibre(
	Fecha DATE NOT NULL,
    Motivo VARCHAR(120),
    Aprobado BOOL NOT NULL,
    Tramitado BOOL NOT NULL,
    PRIMARY KEY(Fecha)    
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Empresa(
	IdEmpresa INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Calle VARCHAR(45) NOT NULL,
    CodigoPostal INT NOT NULL,
    Correo VARCHAR(45),
    Telefono INT NOT NULL,
    PRIMARY KEY(IdEmpresa)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Proyecto(
	IdProyecto INT NOT NULL,
    PRIMARY KEY(IdProyecto),
    Empresa_IdEmpresa INT NOT NULL,
    CONSTRAINT FKProyecto_empresa
    FOREIGN KEY(Empresa_IdEmpresa)
    REFERENCES Empresa(IdEmpresa)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS EmpleadoEmpresa(
	IdEmpleadoEmpresa INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Apellidos VARCHAR(45) NOT NULL,
    Telefono INT NOT NULL,
    Correo VARCHAR(45),
    Contrasenia VARCHAR(45),
    PRIMARY KEY(Correo),
    DiaLibre_Fecha DATE,
    CONSTRAINT FKEmpleadoEmpresa_DiaLibre
    FOREIGN KEY(DiaLibre_fecha)
    REFERENCES DiaLibre(Fecha)
    
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Calendario(
	Fecha DATE NOT NULL,
    HoraEntrada TIME NOT NULL,
    HoraSalida TIME NOT NULL,
    PRIMARY KEY(Fecha),
    Correo VARCHAR(45) NOT NULL UNIQUE, #creo una clave foranea para relacion 1 a 1 con EmpleadoEmpresa pero al ser unica no se puede repetir
    FOREIGN KEY (Correo)
    REFERENCES EmpleadoEmpresa(Correo)
)ENGINE=INNODB;



CREATE TABLE IF NOT EXISTS Proyecto_Empleado(
	Horas INT,
	proyecto_id_proyecto INT NOT NULL,
	empleado_correo VARCHAR(45) NOT NULL,
    PRIMARY KEY (proyecto_id_proyecto,empleado_correo),
    CONSTRAINT fkempleado_proyecto_empleado
    FOREIGN KEY(empleado_correo)
    REFERENCES EmpleadoRRHH(Correo),
    CONSTRAINT fkproyecto_empleado_proyecto
    FOREIGN KEY(proyecto_id_proyecto)
    REFERENCES Proyecto(IdProyecto)
)ENGINE=INNODB;

INSERT INTO EmpleadoEmpresa VALUES ('0000','Pruebas', '{admin , admin}','000000000','adminadmin@correo.com','Pruebas',null);
INSERT INTO EmpleadoEmpresa VALUES ('0001','Francisco', '{Cabrera , Sanchez}','689447451','francabrera@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0002','Javier', '{Casas , Vidal}','784516211','javiercasas@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0003','Marcos', '{Reyes , Suarez}','483954961','marcosreyes@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0004','Unai', '{Soler , Moreno}','586614262','unaisoler@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0005','Rubén', '{Ramirez , Garcia}','532687752','rramirez@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0006','Guillermo', '{Parra , Iglesias}','873773953','parraman@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0007','Rubén', '{Lopez , Vicente}','563159863','rubenlopez@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0008','Fernando', '{Cortes , Peña}','819566664','fernandocortes@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0009','Arnau', '{Pujol , Blas}','467353694','arnaupujol@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0010','Santiago', '{Pena , Pastor}','391454725','santiagopeña@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0011','Raquel', '{Garcia , Panadero}','242319235','raquelgarciao@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0012','Lara', '{Gonzalez , Gonzalez}','228475716','laragonzalez@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0013','Alicia', '{Nuñez , Marin}','519693636','alicianuñez@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0014','Helena', '{Campos , Fuentes}','445388867','helenacampos@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0015','Berta', '{Jimenez , Romero}','268494237','bertajimenez@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0016','Alba', '{Gil , Calvo}','938143228','albagil@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0017','Mara', '{Sola , Blanco}','685258148','marasola@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0018','Miriam', '{Crespo , Gomez}','135631649','miriamcrespo@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0019','Candela', '{Lozano , Soto}','443798749','candelozano@correo.com','1234',null);
INSERT INTO EmpleadoEmpresa VALUES ('0020','Emma', '{Serra , Gallego}','368185799','emmaserra@correo.com','1234',null);

INSERT INTO Empresa VALUES ('1023', 'Empresa1', 'YazminVille','926', 'empresa1@gmail.com','916783220');
INSERT INTO Empresa VALUES ('2376', 'Empresa2', 'LambertJunction','0210', 'empresa2@gmail.com','916573579');
INSERT INTO Empresa VALUES ('8742', 'Empresa3', 'DanielMountain','39088', 'empresa3@gmail.com','916427559');
INSERT INTO Empresa VALUES ('9658', 'Empresa4', 'GradyWell','53037','empresa4@gmail.com','919744369');
INSERT INTO Empresa VALUES ('3458', 'Empresa5', 'StokesJunctions','04670','empresa5@gmail.com','919555369');


INSERT INTO proyecto  VALUES ('123456789','1023');
INSERT INTO proyecto  VALUES ('15695940','1023');
INSERT INTO proyecto  VALUES ('846825486','1023');
INSERT INTO proyecto  VALUES ('756497265','1023');
INSERT INTO proyecto  VALUES ('121246784','1023');
INSERT INTO proyecto  VALUES ('091251940','2376');
INSERT INTO proyecto  VALUES ('481483855','2376');
INSERT INTO proyecto  VALUES ('631212546','2376');
INSERT INTO proyecto  VALUES ('034812058','2376');
INSERT INTO proyecto  VALUES ('324699976','2376');
INSERT INTO proyecto  VALUES ('834612348','8742');
INSERT INTO proyecto  VALUES ('134812058','8742');
INSERT INTO proyecto  VALUES ('237812058','8742');
INSERT INTO proyecto  VALUES ('038554375','8742');
INSERT INTO proyecto  VALUES ('237662058','8742');
INSERT INTO proyecto  VALUES ('334467892','9658');
INSERT INTO proyecto  VALUES ('196578902','9658');
INSERT INTO proyecto  VALUES ('980980234','9658');
INSERT INTO proyecto  VALUES ('136000345','9658');
INSERT INTO proyecto  VALUES ('784567822','9658');
INSERT INTO proyecto  VALUES ('442386701','3458');
INSERT INTO proyecto  VALUES ('983211255','3458');
INSERT INTO proyecto  VALUES ('979744367','3458');
INSERT INTO proyecto  VALUES ('123443214','3458');
INSERT INTO proyecto  VALUES ('098765456','3458');

INSERT INTO EmpleadoRRHH VALUES ('0050','Julian', '{Perez , Calvo}','938189928','julianperez@correo.com','5678');
INSERT INTO EmpleadoRRHH VALUES ('0051','Mara', '{Lopez , Blanco}','682654848','maralopez@correo.com','5678');
INSERT INTO EmpleadoRRHH VALUES ('0052','Miriam', '{Iglesias , Lozano}','166631649','miriamiglesias@correo.com','5678');
INSERT INTO EmpleadoRRHH VALUES ('0053','Carmen', '{Lozano , Soto}','443799949','carmenlozano@correo.com','5678');
INSERT INTO EmpleadoRRHH VALUES ('0054','Emiliana', '{Llanos , Gallego}','345685799','emilianallanos@correo.com','5678');