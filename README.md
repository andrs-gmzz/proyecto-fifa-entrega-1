# Proyecto FIFA — Entregas 1 y 2

Sistema de información para la gestión de una Copa Mundial de la FIFA.

## Información del equipo

- Integrante: Andrés Gómez
- Curso: Bases de Datos
- Entregas: 1 — Modelo relacional, SQL e integridad sobre el modelo inicial;
  2 — Consultas avanzadas, perfección del modelo y roles
- Motor: Oracle Database
- Cliente: Oracle SQL Developer

## Alcance de la Entrega 1

La Entrega 1 se implementa sobre el modelo genérico inicial de cinco entidades:

1. `EDICION_MUNDIAL`
2. `ESTADIO`
3. `SELECCION`
4. `PARTIDO`
5. `PARTICIPACION_PARTIDO`

Se agregan únicamente ajustes menores necesarios para cumplir las consultas y reglas
solicitadas: asistencia registrada, estado del partido, resultado de cada participación y
claves compuestas de consistencia entre edición y sus entidades dependientes. Jugadores,
árbitros, grupos, estadísticas detalladas, boletería, prensa e incidencias se presentan como
evolución propuesta en la evaluación crítica (Sección 8.1.8), y se incorporan formalmente
en la Entrega 2.

## Alcance de la Entrega 2

A partir de la evaluación crítica y de la retroalimentación recibida en la sustentación, que no tuvimos de
la Entrega 1, se expande el modelo incorporando las entidades adicionales pertinentes
(jugadores, cuerpo técnico, árbitros, estadísticas, grupos, fases eliminatorias, boletería,
medios, incidencias, entre otras), normalizando hasta Tercera Forma Normal (3FN) y
definiendo roles con restricciones de acceso diferenciadas: Administrador del Torneo,
Analista Deportivo y Auditor/Consulta.

## Estructura prevista del repositorio

```text
.
├── README.md
├── CHANGELOG.md
├── docs/
│   ├── documento_tecnico.md
│   ├── algebra_relacional.md
│   ├── evaluacion_critica.md
│   ├── matriz_rubrica.md
│   └── entrega2/
│       ├── modelo_fisico.md
│       └── roles_privilegios.md
└── sql/
    ├── 01_ddl.sql
    ├── 02_datos_prueba.sql
    ├── 03_vistas.sql
    ├── 04_dml_pruebas.sql
    ├── 05_privilegios.sql
    ├── 06_consultas.sql
    ├── 07_verificacion.sql
    └── entrega2/
        ├── 08_ddl_ampliado.sql
        ├── 09_consultas_avanzadas.sql
        ├── 10_roles.sql
        └── 11_pruebas.sql
```

En este primer avance solo se publican `README.md`, `CHANGELOG.md`.
Los documentos técnicos y scripts SQL se incorporarán mediante commits posteriores para
que el progreso quede visible paso a paso.

La matriz de trazabilidad de la rúbrica se incorporará junto con el primer avance técnico
de documentación.

## Orden de ejecución en SQL Developer

Ejecutar cada archivo conectado al esquema asignado por el curso y usando **Run Script
(F5)**, porque los scripts contienen bloques PL/SQL terminados con `/`.

1. `sql/01_ddl.sql` — tablas, restricciones, triggers e índices.
2. `sql/02_datos_prueba.sql` — dataset sintético coherente.
3. `sql/03_vistas.sql` — cinco vistas justificadas.
4. `sql/06_consultas.sql` — las quince consultas solicitadas.
5. `sql/04_dml_pruebas.sql` — ciclo de vida, errores controlados y `ON DELETE`.
6. `sql/05_privilegios.sql` — roles y `GRANT`/`REVOKE`; ejecutar con permisos DBA o
   solicitar su ejecución al administrador del servidor.
7. `sql/07_verificacion.sql` — conteos y comprobaciones para capturar evidencias.

Los scripts no contienen credenciales reales. Antes de ejecutar, completar los datos de
conexión entregados por el curso:

```text
Host:     <HOST_DEL_CURSO>
Puerto:   <PUERTO_DEL_CURSO>
Servicio: <SERVICE_NAME_O_SID>
Usuario:  <SCHEMA_DEL_CURSO>
```

## Conexión y seguridad

- `ROL_FIFA_E1_ANDRES_CONSULTA` solo recibe permisos de lectura.
- `ROL_FIFA_E1_ANDRES_OPERATIVO` recibe permisos de lectura e inserción/actualización sobre las
  tablas transaccionales (`PARTIDO` y `PARTICIPACION_PARTIDO`), sin permisos de borrado.
- Oracle no implementa `ON UPDATE CASCADE` en claves foráneas. El documento técnico
  explica esta limitación y la decisión de usar `NO ACTION` implícito para preservar
  referencias.

## Flujo de trabajo Git

Aunque el trabajo sea individual, se conservará trazabilidad mediante ramas y pull
requests:

```text
main
├── feature/modelo-documental
├── feature/ddl-restricciones
├── feature/datos-vistas
├── feature/dml-privilegios
├── feature/consultas-pruebas
├── feature/revision-entrega-1
├── feature/entrega-2-modelo-avanzado
└── feature/entrega-2-roles-pruebas
```

Cada semana se debe:

1. Crear o actualizar una rama de trabajo.
2. Registrar cambios pequeños y descriptivos con commits frecuentes.
3. Abrir un pull request hacia `main`.
4. Actualizar `CHANGELOG.md` con objetivo, tareas, responsable, rama y dificultades.
5. Integrar el pull request después de revisar que los scripts siguen ejecutando.

Cuando se cree el repositorio remoto en GitHub, enlazarlo sin almacenar credenciales:

```powershell
git remote add origin https://github.com/andrs-gmzz/proyecto-fifa-entrega-1.git
git branch -M main
git push -u origin main
```

## Cronograma de avances

| Semana | Hito | Actividad | Responsable | Evidencia |
|---|---|---|---|---|
| 1 | Alcance y supuestos | Revisar enunciado y rúbrica; redactar descripción del problema, alcance y supuestos de modelado | Andrés Gómez | `README.md`, `CHANGELOG.md` |
| 2 | Modelo ER y lógico | Diagramar el ERD y transformarlo a modelo lógico; construir el diccionario de datos | Andrés Gómez | `docs/documento_tecnico.md` |
| 3 | Integridad y reglas de negocio | Implementar DDL, PK/FK con `ON DELETE`/`ON UPDATE` justificado, `CHECK`/`UNIQUE`, índices y restricciones de negocio adicionales | Andrés Gómez | `sql/01_ddl.sql` |
| 4 | Datos y vistas | Cargar dataset sintético (mínimo 100 registros por tabla principal) y crear entre 4 y 5 vistas justificadas | Andrés Gómez | `sql/02_datos_prueba.sql`, `sql/03_vistas.sql` |
| 5 | DML y privilegios | Probar ciclo de vida de un partido, operaciones inválidas, `ON DELETE` y roles con `GRANT`/`REVOKE` | Andrés Gómez | `sql/04_dml_pruebas.sql`, `sql/05_privilegios.sql` |
| 6 | Álgebra, consultas y evaluación crítica | Traducir consultas a álgebra relacional, resolver las quince consultas SQL y redactar la evaluación crítica del modelo inicial | Andrés Gómez | `sql/06_consultas.sql`, `docs/algebra_relacional.md`, `docs/evaluacion_critica.md` |
| 7 | Revisión y sustentación (Entrega 1) | Ejecutar todo en el servidor, capturar evidencias, integrar ramas a `main` y sustentar de forma individual | Andrés Gómez | `sql/07_verificacion.sql`, capturas de resultados |
| 8 | Expansión del modelo (Entrega 2) | Incorporar nuevas entidades, avanzar al modelo físico normalizado (3FN) y construir consultas avanzadas | Andrés Gómez | `docs/entrega2/modelo_fisico.md`, `sql/entrega2/08_ddl_ampliado.sql`, `sql/entrega2/09_consultas_avanzadas.sql` |
| 9 | Roles y pruebas (Entrega 2) | Definir roles diferenciados (Administrador, Analista Deportivo, Auditor) y ejecutar casos de prueba válidos y fallidos | Andrés Gómez | `sql/entrega2/10_roles.sql`, `sql/entrega2/11_pruebas.sql` |
| 10 | Cierre y sustentación (Entrega 2) | Integrar ramas a `main`, revisar `README.md`/`CHANGELOG.md` y preparar la sustentación en panel público | Andrés Gómez | versión final y pull request |

Las semanas y actividades se deben ajustar a las fechas oficiales publicadas por el curso.
