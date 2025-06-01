
-- Crear algunos registros para polar la base de datos

-- 1. Insertar Acompañante
INSERT INTO ACOMPANANTE (TipoID, PrimerApellido, SegundoApellido, PrimerNombre, SegundoNombre, Parentesco)
VALUES ('CC', 'Gómez', 'Rojas', 'María', 'Luisa', '01');

-- 2. Insertar Paciente (referencia AcompananteID = 1)
INSERT INTO PACIENTE (
    TipoID, PrimerApellido, SegundoApellido, PrimerNombre, SegundoNombre,
    FechaNacimiento, SexoBiologico, IdentidadGenero, Ocupacion,
    Pais, Municipio, Etnia, ComunidadEtnica, ZonaResidencia, AcompananteID
)
VALUES (
    'CC', 'Pérez', 'López', 'Juan', 'Carlos',
    '1990-06-15', 'M', 'M', 'Ingeniero',
    'Colombia', 'Medellín', '03', '004', '06', 1
);

-- 3. Insertar Profesional
INSERT INTO PROFESIONAL (TipoID, Nombre, Especialidad)
VALUES ('CC', 'Dra. Carolina Ruiz', 'Medicina General');

-- 4. Insertar Consulta (PacienteID = 1, ProfesionalID = 1)
INSERT INTO MOTIVO_CONSULTA (MotivoAtencion, ExamenFisico, PacienteID, ProfesionalID)
VALUES (
    'Dolor abdominal persistente',
    'Abdomen blando, dolor en cuadrante inferior derecho',
    1, 1
);

-- 5. Insertar Diagnóstico (ConsultaID = 1)
INSERT INTO DIAGNOSTICO (DiagnosticoCod, DiagnosticoNombre, DiagnosticoTipo, ConsultaID)
VALUES ('K35', 'Apendicitis aguda', 'Principal', 1);

-- 6. Insertar Antecedente Familiar (PacienteID = 1)
INSERT INTO ANTECEDENTES_FAMILIARES (PacienteID, Descripcion, TipoAntecedente)
VALUES (1, 'Antecedentes de hipertensión arterial en madre', 'Hipertensión');

-- 7. Insertar Conducta Final (ConsultaID = 1)
INSERT INTO CONDUCTA_FINAL (ConsultaID, ConductaDescripcion)
VALUES (1, 'Remisión a cirugía general para apendicectomía');

SELECT * FROM PACIENTE 
WHERE TipoID = 'CC' AND PrimerApellido = 'Pérez' AND SegundoApellido = 'López' AND PrimerNombre = 'Juan' AND FechaNacimiento = '1990-06-15';

SELECT * FROM PROFESIONAL 
WHERE TipoID = 'CC' AND Nombre = 'Dra. Carolina Ruiz' AND Especialidad = 'Medicina General';

