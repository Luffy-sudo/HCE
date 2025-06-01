CREATE OR ALTER VIEW ResumenAtencion AS
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
    A.AcompananteID,
    CONCAT(A.PrimerNombre, ' ', A.SegundoNombre, ' ', A.PrimerApellido, ' ', A.SegundoApellido) AS NombreAcompanante,
    A.Parentesco,

    -- Antecedentes familiares
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

SELECT * FROM ResumenAtencion;
