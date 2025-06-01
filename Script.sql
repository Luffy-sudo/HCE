-- Crear la base de datos
CREATE DATABASE HistoriaClinicaElectronica;
GO

-- Usar la base de datos recién creada
USE HistoriaClinicaElectronica;
GO

-- Tabla PACIENTE
CREATE TABLE PACIENTE (
    PacienteID INT PRIMARY KEY,
    TipoID VARCHAR(10),
    PrimerApellido VARCHAR(50),
    SegundoApellido VARCHAR(50),
    PrimerNombre VARCHAR(50),
    SegundoNombre VARCHAR(50),
    FechaNacimiento DATE,
    SexoBiologico VARCHAR(20),
    IdentidadGenero VARCHAR(30),
    Ocupacion VARCHAR(100),
    Pais VARCHAR(50),
    Municipio VARCHAR(50),
    Etnia VARCHAR(50),
    ComunidadEtnica VARCHAR(50)
);

-- Tabla ACOMPANANTE (relación uno a uno con PACIENTE)
CREATE TABLE ACOMPANANTE (
    AcompananteID INT PRIMARY KEY,
    PacienteID INT UNIQUE,
    TipoID VARCHAR(10),
    PrimerApellido VARCHAR(50),
    SegundoApellido VARCHAR(50),
    PrimerNombre VARCHAR(50),
    SegundoNombre VARCHAR(50),
    Parentesco VARCHAR(50),
    FOREIGN KEY (PacienteID) REFERENCES PACIENTE(PacienteID)
);

-- Tabla ANTECEDENTES_FAMILIARES
CREATE TABLE ANTECEDENTES_FAMILIARES (
    AntecedenteID INT PRIMARY KEY,
    PacienteID INT,
    Descripcion TEXT,
    TipoAntecedente VARCHAR(100),
    FOREIGN KEY (PacienteID) REFERENCES PACIENTE(PacienteID)
);

-- Tabla PROFESIONAL
CREATE TABLE PROFESIONAL (
    ProfesionalID INT PRIMARY KEY,
    TipoID VARCHAR(10),
    Nombre VARCHAR(100),
    Especialidad VARCHAR(100)
);

-- Tabla MOTIVO_CONSULTA
CREATE TABLE MOTIVO_CONSULTA (
    ConsultaID INT PRIMARY KEY,
    MotivoAtencion TEXT,
    ExamenFisico TEXT,
    PacienteID INT,
    ProfesionalID INT,
    FOREIGN KEY (PacienteID) REFERENCES PACIENTE(PacienteID),
    FOREIGN KEY (ProfesionalID) REFERENCES PROFESIONAL(ProfesionalID)
);

-- Tabla CONDUCTA_FINAL
CREATE TABLE CONDUCTA_FINAL (
    ConductaID INT PRIMARY KEY,
    ConsultaID INT,
    ConductaDescripcion TEXT,
    FechaRegistro DATE,
    FOREIGN KEY (ConsultaID) REFERENCES MOTIVO_CONSULTA(ConsultaID)
);

-- Tabla DIAGNOSTICO
CREATE TABLE DIAGNOSTICO (
    DiagnosticoID INT PRIMARY KEY,
    DiagnosticoCod VARCHAR(20),
    DiagnosticoNombre VARCHAR(100),
    DiagnosticoTipo VARCHAR(50),
    ConsultaID INT,
    FOREIGN KEY (ConsultaID) REFERENCES MOTIVO_CONSULTA(ConsultaID)
);

USE HistoriaClinicaElectronica;
GO

-- Insertar registros en la tabla PACIENTE
INSERT INTO PACIENTE (PacienteID, TipoID, PrimerApellido, SegundoApellido, PrimerNombre, SegundoNombre, FechaNacimiento, SexoBiologico, IdentidadGenero, Ocupacion, Pais, Municipio, Etnia, ComunidadEtnica) VALUES
(1, 'CC', 'Gomez', 'Perez', 'Juan', 'Carlos', '1982-04-30', 'Masculino', 'Hombre', 'Ingeniero', 'Colombia', 'Bogotá', 'Mestizo', 'Comunidad1'),
(2, 'CC', 'Martinez', 'Lopez', 'Ana', 'Maria', '1979-09-07', 'Femenino', 'Mujer', 'Doctora', 'Colombia', 'Medellín', 'Afrodescendiente', 'Comunidad2'),
(3, 'CC', 'Rodriguez', 'Garcia', 'Pedro', 'Luis', '1990-11-15', 'Masculino', 'Hombre', 'Abogado', 'Colombia', 'Cali', 'Indígena', 'Comunidad3'),
(4, 'CC', 'Hernandez', 'Martinez', 'Laura', 'Beatriz', '1985-06-22', 'Femenino', 'Mujer', 'Enfermera', 'Colombia', 'Barranquilla', 'Mestizo', 'Comunidad4'),
(5, 'CC', 'Gonzalez', 'Ramirez', 'Carlos', 'Andres', '1995-01-30', 'Masculino', 'Hombre', 'Profesor', 'Colombia', 'Cartagena', 'Afrodescendiente', 'Comunidad5'),
(6, 'CC', 'Lopez', 'Diaz', 'Marta', 'Isabel', '1988-03-18', 'Femenino', 'Mujer', 'Contadora', 'Colombia', 'Bucaramanga', 'Mestizo', 'Comunidad6'),
(7, 'CC', 'Perez', 'Sanchez', 'Luis', 'Fernando', '1992-07-25', 'Masculino', 'Hombre', 'Arquitecto', 'Colombia', 'Pereira', 'Indígena', 'Comunidad7'),
(8, 'CC', 'Ramirez', 'Torres', 'Sofia', 'Patricia', '1983-12-05', 'Femenino', 'Mujer', 'Psicóloga', 'Colombia', 'Manizales', 'Afrodescendiente', 'Comunidad8'),
(9, 'CC', 'Diaz', 'Morales', 'Jorge', 'Enrique', '1991-08-14', 'Masculino', 'Hombre', 'Médico', 'Colombia', 'Ibagué', 'Mestizo', 'Comunidad9'),
(10, 'CC', 'Sanchez', 'Castro', 'Mariana', 'Alejandra', '1987-05-09', 'Femenino', 'Mujer', 'Ingeniera', 'Colombia', 'Neiva', 'Indígena', 'Comunidad10');

-- Insertar registros en la tabla ACOMPANANTE
INSERT INTO ACOMPANANTE (AcompananteID, PacienteID, TipoID, PrimerApellido, SegundoApellido, PrimerNombre, SegundoNombre, Parentesco) VALUES
(1, 3, 'CC', 'Perez', 'Gomez', 'Carlos', 'Andres', 'Padre'),
(2, 5, 'CC', 'Lopez', 'Martinez', 'Maria', 'Jose', 'Madre'),
(3, 7, 'CC', 'Garcia', 'Rodriguez', 'Luis', 'Fernando', 'Hermano'),
(4, 9, 'CC', 'Martinez', 'Hernandez', 'Beatriz', 'Elena', 'Hermana'),
(5, 11, 'CC', 'Ramirez', 'Gonzalez', 'Andres', 'Felipe', 'Padre'),
(6, 13, 'CC', 'Diaz', 'Lopez', 'Isabel', 'Cristina', 'Madre'),
(7, 15, 'CC', 'Sanchez', 'Perez', 'Fernando', 'Jose', 'Hermano'),
(8, 17, 'CC', 'Torres', 'Ramirez', 'Patricia', 'Elena', 'Hermana'),
(9, 19, 'CC', 'Morales', 'Diaz', 'Enrique', 'Luis', 'Padre'),
(10, 21, 'CC', 'Castro', 'Sanchez', 'Alejandra', 'Maria', 'Madre');

-- Insertar registros en la tabla ANTECEDENTES_FAMILIARES
INSERT INTO ANTECEDENTES_FAMILIARES (AntecedenteID, PacienteID, Descripcion, TipoAntecedente) VALUES
(2, 1, 'Diabetes en la familia', 'Diabetes'),
(4, 2, 'Hipertensión en la familia', 'Hipertensión'),
(6, 3, 'Cáncer en la familia', 'Cáncer'),
(8, 4, 'Enfermedades cardíacas en la familia', 'Cardíacas'),
(10, 5, 'Asma en la familia', 'Asma'),
(12, 6, 'Alergias en la familia', 'Alergias'),
(14, 7, 'Obesidad en la familia', 'Obesidad'),
(16, 8, 'Enfermedades renales en la familia', 'Renales'),
(18, 9, 'Enfermedades hepáticas en la familia', 'Hepáticas'),
(20, 10, 'Enfermedades autoinmunes en la familia', 'Autoinmunes');

-- Insertar registros en la tabla PROFESIONAL
INSERT INTO PROFESIONAL (ProfesionalID, TipoID, Nombre, Especialidad) VALUES
(101, 'CC', 'Dr. Juan Perez', 'Cardiología'),
(102, 'CC', 'Dra. Ana Martinez', 'Pediatría'),
(103, 'CC', 'Dr. Pedro Rodriguez', 'Neurología'),
(104, 'CC', 'Dra. Laura Hernandez', 'Dermatología'),
(105, 'CC', 'Dr. Carlos Gonzalez', 'Ginecología'),
(106, 'CC', 'Dra. Marta Lopez', 'Psiquiatría'),
(107, 'CC', 'Dr. Luis Perez', 'Oftalmología'),
(108, 'CC', 'Dra. Sofia Ramirez', 'Oncología'),
(109, 'CC', 'Dr. Jorge Diaz', 'Urología'),
(110, 'CC', 'Dra. Mariana Sanchez', 'Endocrinología');

-- Insertar registros en la tabla MOTIVO_CONSULTA
INSERT INTO MOTIVO_CONSULTA (ConsultaID, MotivoAtencion, ExamenFisico, PacienteID, ProfesionalID) VALUES
(1001, 'Dolor de pecho', 'Examen físico normal', 1, 1),
(1002, 'Fiebre alta', 'Examen físico normal', 2, 2),
(1003, 'Dolor de cabeza', 'Examen físico normal', 3, 3),
(1004, 'Erupción cutánea', 'Examen físico normal', 4, 4),
(1005, 'Dolor abdominal', 'Examen físico normal', 5, 5),
(1006, 'Ansiedad', 'Examen físico normal', 6, 6),
(1007, 'Problemas de visión', 'Examen físico normal', 7, 7),
(1006, 'Bulto en el pecho', 'Examen físico normal', 8, 8),
(1009, 'Dolor al orinar', 'Examen físico normal', 9, 9),
(1010, 'Problemas hormonales', 'Examen físico normal', 10, 10);

-- Insertar registros en la tabla CONDUCTA_FINAL
INSERT INTO CONDUCTA_FINAL (ConductaID, ConsultaID, ConductaDescripcion, FechaRegistro) VALUES
(1100, 1001, 'Recetar analgésicos', '2023-01-01'),
(1200, 1002, 'Recetar antipiréticos', '2023-01-02'),
(1300, 1003, 'Recetar analgésicos', '2023-01-03'),
(1400, 1004, 'Recetar antihistamínicos', '2023-01-04'),
(1500, 1005, 'Recetar antiespasmódicos', '2023-01-05'),
(1600, 1006, 'Recetar ansiolíticos', '2023-01-06'),
(1700, 1007, 'Recetar gafas', '2023-01-07'),
(1800, 1008, 'Solicitar mamografía', '2023-01-08'),
(1900, 1009, 'Recetar antibióticos', '2023-01-09'),
(2000, 1010, 'Solicitar análisis hormonales', '2023-01-10');

-- Insertar registros en la tabla DIAGNOSTICO
INSERT INTO DIAGNOSTICO (DiagnosticoID, DiagnosticoCod, DiagnosticoNombre, DiagnosticoTipo, ConsultaID) VALUES
(2100, 'I20', 'Angina de pecho', 'Cardiología', 1001),
(2200, 'R50', 'Fiebre', 'Pediatría', 1002),
(2300, 'G44', 'Cefalea', 'Neurología', 1003),
(2400, 'L20', 'Dermatitis', 'Dermatología', 1004),
(2500, 'K52', 'Gastroenteritis', 'Ginecología', 1005),
(2600, 'F41', 'Trastorno de ansiedad', 'Psiquiatría', 1006),
(2700, 'H52', 'Trastornos de la refracción', 'Oftalmología', 1007),
(2800, 'C50', 'Neoplasia de mama', 'Oncología', 1008),
(2900, 'N39', 'Infección del tracto urinario', 'Urología', 1009),
(3000, 'E03', 'Hipotiroidismo', 'Endocrinología', 1010);

SELECT 
    A.AcompananteID,
    A.PrimerNombre,
    A.SegundoNombre,
    A.PrimerApellido,
    A.SegundoApellido,
    A.Parentesco
FROM 
    PACIENTE AS P
JOIN 
    ACOMPANANTE AS A ON P.PacienteID = A.PacienteID
WHERE 
    P.PacienteID = '1';  -- Reemplaza con el número real
	

CREATE VIEW ResumenAtencion AS
SELECT 
    P.PacienteID,
    CONCAT(P.PrimerNombre, ' ', P.SegundoNombre, ' ', P.PrimerApellido, ' ', P.SegundoApellido) AS NombrePaciente,
    P.FechaNacimiento,
    P.SexoBiologico,
    P.IdentidadGenero,
    P.Ocupacion,
    P.Pais,
    P.Municipio,
    P.Etnia,
    P.ComunidadEtnica,

    -- Acompañante
    CONCAT(A.PrimerNombre, ' ', A.SegundoNombre, ' ', A.PrimerApellido, ' ', A.SegundoApellido) AS NombreAcompanante,
    A.Parentesco,

    -- Antecedentes familiares (puede haber varios)
    AF.TipoAntecedente,
    AF.Descripcion AS DescripcionAntecedente,

    -- Motivo de consulta
    MC.ConsultaID,
    MC.MotivoAtencion,
    MC.ExamenFisico,

    -- Profesional
    PR.Nombre AS NombreProfesional,
    PR.Especialidad,

    -- Diagnóstico
    D.DiagnosticoCod,
    D.DiagnosticoNombre,
    D.DiagnosticoTipo,

    -- Conducta final
    CF.ConductaDescripcion,
    CF.FechaRegistro

FROM PACIENTE P
LEFT JOIN ACOMPANANTE A ON P.PacienteID = A.PacienteID
LEFT JOIN ANTECEDENTES_FAMILIARES AF ON P.PacienteID = AF.PacienteID
LEFT JOIN MOTIVO_CONSULTA MC ON P.PacienteID = MC.PacienteID
LEFT JOIN PROFESIONAL PR ON MC.ProfesionalID = PR.ProfesionalID
LEFT JOIN DIAGNOSTICO D ON MC.ConsultaID = D.ConsultaID
LEFT JOIN CONDUCTA_FINAL CF ON MC.ConsultaID = CF.ConsultaID;