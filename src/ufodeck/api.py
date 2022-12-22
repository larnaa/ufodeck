from fastapi import FastAPI
from fastapi import Request
from fastapi import Response
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from ufodeck.main import manage_windows
from typing import Any
from typing import Dict

app = FastAPI()


templates = Jinja2Templates(directory="templates")
app.mount("/static", StaticFiles(directory="static"), name="static")


@app.get("/", response_class=HTMLResponse)
async def home(request: Request) -> Response:
    data = {"page": "Home page"}
    return templates.TemplateResponse("base.html", {"request": request, "data": data})


@app.get("/windows/{switch}")
async def get_switch(switch: str) -> Dict[str, Any]:
    status = manage_windows(switch)
    return {"status": f"{status}"}
