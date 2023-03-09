# UFOdeck

**Table of Contents**
- [Ufodeck](#ufodeck)
- [Start server](#start-server)
- [WEB and Android](#viewes-on-different-platforms)

## Start server

```bash
$ git clone https://github.com/larnaa/ufodeck.git

## Install dependencies.
$ hatch install

## Run with your host and port.
$ uvicorn src.ufodeck.api:app --host localhost --port 8000

## --reload: make the server restart after code changes.
## Do this for development only.
$ uvicorn src.ufodeck.api:app --reload
```

## Views on different platforms

![Alt text](src/ufodeck/documentation/images/web-Firefox.png)
![Alt text](src/ufodeck/documentation/images/android-firefox.png)
<img align="right" width="100" height="100" src="src/ufodeck/documentation/images/web-Firefox.png">
<img align="right" width="100" height="100" src="src/ufodeck/documentation/images/android-firefox.png">

## Purpose

Functional:
1. Editor
   1. Naming script
   2. Write/past script
   3. Save script
   4. List: change connections buttons and scripts
   5. Save changes 
2. Panel
   1. Run the script (push button)
   2. View logs 
   3. Go to Editor
   4. Close program

<img align="right" width="100" height="100" src="src/ufodeck/documentation/images/android-firefox.png">

