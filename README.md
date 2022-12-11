# ufodeck

[![PyPI - Version](https://img.shields.io/pypi/v/ufodeck.svg)](https://pypi.org/project/ufodeck)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/ufodeck.svg)](https://pypi.org/project/ufodeck)

-----

**Table of Contents**

- [ufodeck](#ufodeck)
  - [Installation](#installation)
  - [License](#license)
- [Other](#other)
  - [Potry --\> hatch](#potry----hatch)
  - [ufodeck plan](#ufodeck-plan)

## Installation

```console
pip install ufodeck
```

## License

`ufodeck` is distributed under the terms of the [MIT](https://spdx.org/licenses/MIT.html) license.

---

# Other


## ufodeck plan

1. Connect to the local server with ssh
2. Commands
   1. Get data for the front view
3. FastAPI Client
4. Create front Client  
Interface ideas:
https://i.pinimg.com/originals/bc/92/e4/bc92e4718349f3debdcd54821e5bc4bd.jpg
https://upload.wikimedia.org/wikipedia/commons/f/fe/WP_Space_Ship_Control_Panel.PNG
https://hackster.imgix.net/uploads/attachments/1233911/feedt3rkiokhb6m_gN9PrsJXzE.jpg?auto=compress%2Cformat&w=830&h=466.875&fit=min&dpr=2.625
https://i.makeagif.com/media/7-30-2015/S1foCk.gif 


[project]
name = "ufodeck"
description = 'Tool to manage loading OS and visualize OS state.'
license = "MIT"
authors = [
  { name = "larnaa", email = "larnaa@larnaa.pw" },
]
dynamic = ["version"]

[tool.hatch.version]
path = "src/__init__.py"

[tool.hatch.envs.default]
dependencies = [
  "rtoml",
  "pytest",
  "pytest-cov"
]

[tool.hatch.envs.default.scripts] 
cov = "pytest --cov-report=term-missing --cov-config=pyproject.toml --cov=ufodeck --cov=tests"
no-cov = "cov --no-cov"

[[tool.hatch.envs.test.matrix]]
python = ["37", "38", "39", "310", "311"]

[tool.coverage.run]
branch = true
parallel = true
omit = [
  "src/__init__.py",
]

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

