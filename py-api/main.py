import os
import typer
from manito_api import ManitoArm
import time
import math

colors = ["green", "blue", "red", "white", "yellow", "purple"]
positions = {"Initial": [0,0.41,0.50], "garra": [0,0.41,0.50]}

def truncdeci(numero, decimales):
    factor = 10 ** decimales
    return math.trunc(numero * factor) / factor

def move_to(body):
    response = arm._session.post(
        f"{arm.url}/api/v1/command",
        json=body,
        timeout=10,
    )
    response.raise_for_status()
    return response.json()
    

def accion(action):
    response = worldstatus()
    
    # Extract important blocks position.
    for color in colors:
        if color in action:
            positions[color] = response["entities"][color]
    
    print(positions)
    
    action = action.strip("()")
    print("Siguiente")
    
    #Go Up first
    if action == "first":
        move_to({
                "action": "move_to",
                "x": positions["garra"][0],
                "y": positions["garra"][1],
                "z": 0.6,
                })
    ## (movehorizontal garra xygarra xygreen)
    if action.startswith("movehorizontal"):
        
        ## Mover xy garra a xycolor/otro 
        variables = action.split()
        toname = variables[3]
        toname = toname[2:]
        if "garra" in toname:
            toname = "Initial"
            
        pos = [positions[toname][0], positions[toname][1], positions["garra"][2]]
        print(pos)
        move_to({
        "action": "move_to",
        "x": pos[0],
        "y": pos[1],
        "z": pos[2],
        })
        positions["garra"] = pos
        
        
        
    if action.startswith("moverabajo"):
        ## Mover xy garra a xycolor/otro 
        variables = action.split()
        toname = variables[3]
        toname = toname[1:]
        
        if "garra" in toname:
            toname = "Initial"
              
        pos = [positions["garra"][0], positions["garra"][1], positions[toname][2]+0.15]
        print(pos)
        yfactor = 0
        haspassed = False
        if isclawclosed():
            for color in colors:
                if color in positions:
                    xgarra = truncdeci(positions["garra"][0],3)
                    xbloque = truncdeci(positions[color][0],3)
                    ygarra = truncdeci(positions["garra"][1],3)
                    ybloque = truncdeci(positions[color][1],3)
                    if ybloque - 0.2 <= ygarra <= ybloque + 0.2 and xbloque - 0.2 <= xgarra <= xbloque + 0.2 :
                        if not haspassed:
                            haspassed = True
                            continue
                        yfactor += 1
                        
        print(yfactor)
        pos[2] = pos[2] + (yfactor*0.04)
        move_to({
        "action": "move_to",
        "x": pos[0],
        "y": pos[1],
        "z": pos[2],
        })
        
    if action.startswith("tomar"):
        arm.gripper(True)
        time.sleep(2)
        return
        
    if action.startswith("moverarriba"):
        ## Mover xy garra a xycolor/otro 
        variables = action.split()
        toname = variables[3]
        toname = toname[1:]
        
        if "garra" in toname:
            toname = "Initial"
              
        pos = [positions["garra"][0], positions["garra"][1], positions[toname][2]+0.15]
        print(pos)
        
        move_to({
        "action": "move_to",
        "x": pos[0],
        "y": pos[1],
        "z": pos[2],
        })
        
    if action.startswith("soltar"):
        arm.gripper(False)
    
    if action.startswith("desapilar"):
            arm.gripper(True)
    
    if action.startswith("apilar"):
            arm.gripper(False)
            time.sleep(2)
            return
    

def worldstatus():
    response = arm._session.get(f"{arm.url}/api/v1/state", timeout=10)
    response.raise_for_status()
    worldjson=response.json()
    return worldjson

def isclawclosed():
    response = arm._session.get(f"{arm.url}/api/status", timeout=10)
    response.raise_for_status()
    clawboolean = response.json()
    return clawboolean["gripper"]


arm = ManitoArm(f"http://localhost:8000")


archivo_solucion= "goal-scenario3.pddl.soln"

if os.path.exists(archivo_solucion):
            with open(archivo_solucion, 'r') as archivo:
                pasos = [line.strip() for line in archivo if line.strip()]
                print("\n".join(pasos))
else:
    raise FileNotFoundError(f"Solution file not found: {archivo_solucion}")




accion("first")  
for i in pasos:
    accion(i)
accion("first")