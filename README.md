# kiosk

[![PyPI - Version](https://img.shields.io/pypi/v/kiosk.svg)](https://pypi.org/project/kiosk)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/kiosk.svg)](https://pypi.org/project/kiosk)

-----

**Table of Contents**

- [kiosk](#kiosk)
  - [Installation](#installation)
  - [License](#license)
- [Other](#other)
  - [Potry --\> hatch](#potry----hatch)
  - [Kiosk plan](#kiosk-plan)

## Installation

```console
pip install kiosk
```

## License

`kiosk` is distributed under the terms of the [MIT](https://spdx.org/licenses/MIT.html) license.

---

# Other

- [Potry --\> hatch](#potry----hatch)
- [Kiosk plan](#kiosk-plan)

## Potry --> hatch

1. Necessary packages: ```hatching, tomli-w, httpx```

2. Changes in existing files:  
   
- **pyproject.toml**  

```python
## rename poetry --> hatch
### Redact pyproject.toml 
with open('pyproject.toml', 'r') as file :
  filedata = file.read()
### Replace the target string
filedata = filedata.replace('tool.poetry', 'tool.hatch')
### Write the file out again
with open('pyproject.toml', 'w') as file:
  file.write(filedata)
```

- **build-system**

```toml
## Change to the hatch build-system
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
```

- **project version**  
  - version in src/__init__.py  
  - [tool.poetry] in pyproject.toml

```toml
## dinamic
### version in another file (not in pyproject.toml)
### in pyproject.toml:
[project]
dynamic = ["version"]

[tool.hatch.version]
path = "src/__init__.py"
```
- **move dependencies**
```toml
### in poetry
[tool.poetry.dependencies]
...

### in hatch 
[project]
...
dependencies = [
  ...
]

### ??
[project.optional-dependencies]
option1 = [
  "...",
]
option2 = [
  "...",
]

### set env param for project 
### https://hatch.pypa.io/latest/config/environment/overview/
[tool.hatch.envs.<ENV_NAME>]
```  
- **move scripts from makefile to pyproject.toml**  
Example: https://github.com/pypa/hatch/blob/master/hatch.toml




3. New project: ```hatch new "Hatch Demo"```

4. Venv: ```hatch env create```
   1. Package for venv: ```shellingham```  
   2. Spawn: ```hatch shell```



## Kiosk plan

1. Connect to the local server with ssh
2. Commands
   1. Get data for the front view
3. FastAPI Client
4. Create front Client

