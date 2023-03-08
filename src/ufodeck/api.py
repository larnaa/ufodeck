from fastapi import FastAPI
from fastapi import Request
from fastapi import Response
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from ufodeck.main import run_script
from typing import Any
from typing import Dict


templates = Jinja2Templates(directory="templates")
app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")


@app.get("/", response_class=HTMLResponse)
async def home(request: Request) -> Response:
    data = {"page": "Home page"}
    return templates.TemplateResponse("base.html", {"request": request, "data": data})


@app.get("/page/{page_name}", response_class=HTMLResponse)
async def page(request: Request, page_name: str) -> Response:
    data = {"page": page_name}
    return templates.TemplateResponse("base.html", {"request": request, "data": data})


class System(BaseModel):
    system_name: str


@app.get("/run/{script}")
async def run(script: str) -> Dict[str, Any]:

    status = run_script(script)
    return {"status": f"{status}"}
