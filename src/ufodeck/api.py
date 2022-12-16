from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from src.ufodeck.ufodeck import switch_on_windows

app = FastAPI()


templates = Jinja2Templates(directory="templates")
app.mount("/static", StaticFiles(directory="static"), name="static")


@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    data = {
        "page": "Home page"
    }
    return templates.TemplateResponse("base.html", {"request": request, "data": data})


@app.get("/page/{page_name}", response_class=HTMLResponse)
async def page(request: Request, page_name: str):
    data = {
        "page": page_name
    }
    return templates.TemplateResponse("base.html", {"request": request, "data": data})


class System(BaseModel):
    system_name: str


@app.get("/windows/{switch}")
async def get_switch(switch: str = "on"):
    switch = switch_on_windows
    return {"status": f'{switch}'}


@app.get("/system/{system_name}")
async def get_system(system_name: str):
    if system_name == "windows":
        return {"system_name": system_name, "message": "This is Windows!"}

    return {"system_name": system_name, "message": "This is Linux!"}
