import os
import typer
from manito_api import ManitoArm



def accion(action):
    
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
    
    return worldjson


for i in "goal.soln":
    accion(i)
    pass