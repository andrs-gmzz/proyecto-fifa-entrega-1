# CHANGELOG

Registro semanal del avance verificable del proyecto. Cada entrada debe acompañarse de
commits, ramas o pull requests visibles en GitHub.

## [2026-09-13] — Semana 1: planificación e inicio

- **Objetivo:** comprender la rúbrica, delimitar la Entrega 1 al modelo inicial y
  publicar la base del repositorio.
- **Tareas realizadas:**
  - Revisión del enunciado y de los criterios de evaluación.
  - Definición del motor Oracle Database y del cliente SQL Developer.
  - Preparación local del primer borrador técnico y de los scripts, que se publicarán en
    avances posteriores.
  - Registro del cronograma y del flujo de trabajo Git en `README.md`.
- **Responsable:** Andrés Gómez.
- **Rama:** `main` (preparación inicial).
- **Dificultades:** todavía falta ejecutar la entrega en el servidor y completar los
  datos de conexión entregados por el curso.
- **Evidencia inicial:** `README.md` y `CHANGELOG.md`.

## [2026-09-15] — Semana 2: modelo y documentación

- **Objetivo:** documentar el modelo inicial y su evolución futura.
- **Tareas:** cerrar el ERD, los supuestos, la transformación al modelo lógico, el
  diccionario de datos, la evaluación crítica y la matriz de trazabilidad.
- **Responsable:** Andrés Gómez.
- **Rama:** `feature/modelo-documental`.
- **Dificultades:** aún falta ejecutar y validar los scripts en el servidor Oracle del
  curso.
- **Evidencia:** `docs/documento_tecnico.md`, `docs/algebra_relacional.md`.

## [2026-09-16] — Semana 3: DDL e integridad y restricciones de negocio

- **Objetivo:** ejecutar el DDL en el esquema del curso , validar restricciones y de negocio.
- **Tareas:** Script SQL DDL: creacion de tablas, probar PK, FK, `CHECK`, `UNIQUE`, índices (8.1.2).
- **Responsable:** Andrés Gómez.
- **Rama:** `feature/ddl-restricciones`.
- **Dificultades:** registrar aquí los errores de ejecución y su solución.
- **Evidencia:** sql/01_ddl.sql

## [2026-09-18] — Semana 4: datos y vistas

- **Objetivo:** cargar el dataset sintético y verificar las cinco vistas.
- **Tareas:** Carga de dataset sintético con mínimo 100 registros por tabla principal, validando coherencia
- edición–estadio–selección–partido–participación (8.1.3). Diseño e implementación de entre 4 y 5 vistas
- justificadas (8.1.4): tabla de posiciones parcial, goleadores acumulados, ocupación por estadio y partidos
- con su marcador y sede asociada, contar registros, comprobar coherencia referencial y documentar
- resultados.
- **Responsable:** Andrés Gómez.
- **Rama:** `feature/datos-vistas`.
- **Dificultades:** registrar aquí inconsistencias o ajustes realizados.
- **Evidencia: `sql/02_datos_prueba.sql`, `sql/03_vistas.sql`.


## [Pendiente] — Semana 5: DML y privilegios

- **Objetivo:** probar el ciclo de vida de un partido, operaciones inválidas y roles.
- **Tareas:** Script DML: creación de partido, registro de participaciones y actualización del marcador
- final (8.1.5). Registro de al menos tres intentos de operación inválida que violen restricciones de
- negocio o integridad, documentando el error obtenido en cada caso (8.1.5). Verificación de ON DELETE
- en al menos dos relaciones distintas. Creación de al menos dos usuarios/roles (uno de solo consulta y uno
- operativo) con GRANT/REVOKE documentados y probados (8.1.6).
- **Responsable:** Andrés Gómez.
- **Rama:** `feature/consultas-pruebas`.
- **Dificultades:** registrar aquí las limitaciones del servidor o permisos DBA.
- **Evidencia:** sql/04_dml_pruebas.sql, sql/05_privilegios.sql.
- 
## [2026-09-20] — Semana 6: álgebra relacional, consultas SQL y evaluación crítica

- **Objetivo:** resolver las consultas SQL solicitadas, su equivalente en álgebra relacional y evaluar
- críticamente el modelo inicial.
- **Tareas:** Traducción a notación de álgebra relacional (σ, π, ⋈, ρ, entre otros) de al menos 4 de las
- consultas de la Sección 8.1.9 (8.1.7). Resolución de las 15 consultas SQL sobre el modelo inicial: JOIN,
- subconsultas correlacionadas y no correlacionadas, GROUP BY/HAVING, funciones de agregación y
- reutilización de al menos una vista (8.1.9). Redacción de la evaluación crítica del modelo inicial:
- problemas identificados, ajustes propuestos con su justificación, y bosquejo del diagrama entidad-relación
- ampliado con listado breve de nuevas entidades anticipadas (8.1.8).
- **Responsable:** Andrés Gómez.
- **Rama:** `feature/consultas-pruebas`.
- **Dificultades:** ? .
- **Evidencia:** sql/06_consultas.sql, docs/algebra_relacional.md, docs/evaluacion_critica.md.


## [NO TUVIMOS] — Semana 7: revisión, sustentación y cierre de Entrega 1
- **Objetivo:** ejecutar el flujo completo en el motor de base de datos, preparar evidencias y sustentar en
- modalidad individual.
- **Tareas realizadas:** Verificación de conteos, resultados esperados (Figura 2) y trazabilidad completa en
- GitHub (commits, ramas, pull requests). Revisión final del README.md, integración de ramas a main y
- preparación de material de apoyo para la sustentación individual.
- **Responsable:** Andrés Gómez.
- **Rama:** feature/revision-entrega-1 → integrado a main.
- **Dificultades:** ?.
- **Evidencia:** capturas de resultados, README.md actualizado.

## [2026-09-26] — Semana 8: expansión del modelo y consultas avanzadas (Entrega 2)

- **Objetivo:** incorporar la retroalimentación de la sustentación de la Entrega 1, aunque no tuvimos y
- expandir el modelo con nuevas entidades (jugadores, cuerpo técnico, árbitros, estadísticas, grupos, fases
- eliminatorias, boletería, medios, incidencias, entre otras) (Sección 8.2).
- **Tareas:** Actualizar el modelo lógico y avanzar hacia el modelo físico, normalizando hasta Tercera Forma
- Normal (3FN) (8.2.2). Construir entre 6 y 10 consultas orientadas a análisis deportivo y operativo del
- Mundial, usando JOIN múltiples, subconsultas, CTE (si el motor lo permite) y funciones de agregación, con
- agregaciones por nivel del torneo (Jugador → Partido → Selección → Grupo/Fase → Edición) (8.2.1).
- **Responsable:** Andrés Gómez.
- **Rama:** `feature/consultas-avanzadas`.
- **Dificultades:** registrar aquí los ajustes derivados de la retroalimentación recibida, aunque vuelo y
- recalco que no tuvimos.

## [Pendiente] — Semana 9: roles diferenciados y pruebas (Entrega 2)
- **Objetivo:** definir roles con restricciones de acceso diferenciadas y validar el modelo ampliado con
- casos de prueba.
- **Tareas:** Definición e implementación de los roles Administrador del Torneo, Analista Deportivo y
- Auditor/Consulta, con privilegios diferenciados (8.2.3). Ejecución de casos de prueba exitosos (escenarios
- válidos) y casos de prueba fallidos (violaciones de reglas), documentando resultados (8.2.4).
- **Responsable:** Andrés Gómez.
- **Rama:** `feature/roles-privilegios`.
- **Dificultades:** ?.
