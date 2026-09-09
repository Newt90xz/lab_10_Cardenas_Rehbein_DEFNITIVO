# lab 10
Alonso Cárdenas 
Oskar Rehbein

Nos disculpamos en adelantado, ya que no estan muy ordenados los archivos.

## Tareas

- Levantar (1 caso)
- Apilar (2 casos)
- Separar/Desapilar (2 casos)
- Ordenar en cuadrante (2 casos)
- Mezcla (3 casos)

No estan en ningun orden en particular.

## Ejecutar el solver

Desde la carpeta `py-api`:

```bash
cd py-api
uv run python solver.py --goalfile goal-scenario9.pddl
```

Esto genera el archivo `.pddl.soln` para el problema actual definido.

Si queres cambiar el problema, editá `solver.py` y revisá la variable `goal_test`.

## Ejecutar el main con una solución ya generada

Desde la carpeta `py-api`:

```bash
cd py-api
uv run python main.py --solvefile goal-scenario9.pddl.soln
```

`--solvefile` recibe el nombre del archivo de solución generado por `solver.py`.

Ejemplo:

```bash
cd py-api
uv run python main.py --solvefile goal-scenario1.pddl.soln
```

## Flujo típico

1. Generá una solución con `solver.py`
2. Revisá el archivo `.pddl.soln`
3. Ejecutá `main.py` usando ese archivo con `--solvefile`

Ejemplo completo:

```bash
cd py-api
uv run python solver.py
uv run python main.py --solvefile goal-scenario9.pddl.soln
```
