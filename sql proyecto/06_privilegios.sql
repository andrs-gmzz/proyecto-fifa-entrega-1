-- Entrega 1 BASICA - Privilegios (tema 8: Integridad y Privilegios)
-- Ejecutar conectado como propietario, con permiso para crear roles.
-- Si los roles ya existen, comentar las dos lineas de CREATE ROLE.
-- No contiene contrasenas ni crea usuarios reales.

SET DEFINE OFF;

CREATE ROLE rol_fifa_e1_andres_consulta;
CREATE ROLE rol_fifa_e1_andres_operativo;

------------------------------------------------------------------------
-- Rol de solo consulta: solo SELECT sobre tablas y vistas.
------------------------------------------------------------------------

GRANT SELECT ON edicion_mundial TO rol_fifa_e1_andres_consulta;
GRANT SELECT ON estadio TO rol_fifa_e1_andres_consulta;
GRANT SELECT ON seleccion TO rol_fifa_e1_andres_consulta;
GRANT SELECT ON partido TO rol_fifa_e1_andres_consulta;
GRANT SELECT ON participacion_partido TO rol_fifa_e1_andres_consulta;

GRANT SELECT ON vw_marcador_partidos TO rol_fifa_e1_andres_consulta;
GRANT SELECT ON vw_tabla_posiciones TO rol_fifa_e1_andres_consulta;
GRANT SELECT ON vw_goleadores_sel TO rol_fifa_e1_andres_consulta;
GRANT SELECT ON vw_ocupacion_estadio TO rol_fifa_e1_andres_consulta;
GRANT SELECT ON vw_partidos_atipicos TO rol_fifa_e1_andres_consulta;

------------------------------------------------------------------------
-- Rol operativo: consulta todo y solo modifica el ciclo del partido.
------------------------------------------------------------------------

GRANT SELECT ON edicion_mundial TO rol_fifa_e1_andres_operativo;
GRANT SELECT ON estadio TO rol_fifa_e1_andres_operativo;
GRANT SELECT ON seleccion TO rol_fifa_e1_andres_operativo;
GRANT SELECT ON partido TO rol_fifa_e1_andres_operativo;
GRANT SELECT ON participacion_partido TO rol_fifa_e1_andres_operativo;

GRANT INSERT, UPDATE ON partido TO rol_fifa_e1_andres_operativo;
GRANT INSERT, UPDATE ON participacion_partido TO rol_fifa_e1_andres_operativo;

REVOKE DELETE ON partido FROM rol_fifa_e1_andres_operativo;
REVOKE DELETE ON participacion_partido FROM rol_fifa_e1_andres_operativo;

------------------------------------------------------------------------
-- Evidencia: privilegios otorgados a nivel del esquema.
------------------------------------------------------------------------

SELECT grantee, table_name, privilege
  FROM user_tab_privs_made
 WHERE grantee IN (
        'ROL_FIFA_E1_ANDRES_CONSULTA',
        'ROL_FIFA_E1_ANDRES_OPERATIVO'
       )
 ORDER BY grantee, table_name, privilege;

