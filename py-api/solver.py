import subprocess
import os
import argparse
from pathlib import Path


def solver(dominio, objetivo):
    consola = ["pyperplan", "-H", "hff", "-s", "gbf", dominio, objetivo]
    try:
        solucion = subprocess.run(consola, capture_output=True, text=True)
        if solucion.returncode != 0:
            print(f'El planificador falló con código {solucion.returncode}')
            if solucion.stderr.strip():
                print(solucion.stderr.strip())
            if solucion.stdout.strip():
                print(solucion.stdout.strip())
            return False

        archivo_solucion = f"{objetivo}.soln"
        if os.path.exists(archivo_solucion):
            with open(archivo_solucion, 'r') as archivo:
                pasos = archivo.read()
                print(pasos.strip())
            return True

        print('El planificador se ejecuta pero no crea el archivo')
        print(f'Salida del planificador: {solucion.stdout}')
        return False
    except FileNotFoundError:
        print(f'No se ha podido encontrar el ejecutable: pyperplan')
        return False

## uv run python main.py --solvefile "goal.pddl"
parser = argparse.ArgumentParser()
parser.add_argument("--goalfile", default="goal-scenario9.pddl")
args = parser.parse_args()

goal_test = Path(args.goalfile)

dominio_test = 'domain.pddl'

print(goal_test)
solver(dominio_test, goal_test)
