import os
import typer
from manito_api import ManitoArm



def accion(action):
    response = worldstatus()
    garra = response["entities"]["Manito"]
    bloque1= list(response["entities"].values())[2]
    
    ## (movehorizontal garra xygarra xybloque)
    if action.startswith("(movehorizontal"):
        xyg = "api move on x,y"    
    if action.startswith("(moverabajo)"):
        x = "api move on z"
    if accion.starswith("(tomar)"):
        x = "api tomar"
    if action.startswith("(moverarriba)"):
        x = "api move on z"
    if action.startswith("(soltar)"):
        x = "api soltar"
    if action.starstwith("(apilar)"):
        x = "api soltar sobre"

def worldstatus():
    response = arm._session.get(f"{arm.url}/api/v1/state", timeout=10)
    response.raise_for_status()
    worldjson=response.json()
    return worldjson


arm = ManitoArm(f"http://localhost:8000")
arm.home()


print(response["entities"])


""" for i in "goal.soln":
    accion(i)
    pass """