# "larnaa@192.168.1.2"
# def world():
#     print("Hello World!")

def define_status() -> str:
    status = 100
    if status==100:
        status="Everything is fine."
    return status


from enum import Enum

from fastapi import FastAPI


class ModelSystem(str, Enum):
    windows = "windows"
    linix = "linux"


app = FastAPI()


@app.get("/system/{system_name}")
async def get_model(system_name: ModelSystem):
    if system_name.value == "windows":
        return {"system_name": system_name, "message": "This is Windows!"}

    if system_name.value == "linux":
        return {"system_name": system_name, "message": "Tis is Linux!"}

    return {"system_name": system_name, "message": "Have some residuals"}