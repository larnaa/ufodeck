# UFOdeck

**Table of Contents**

- [Ufodeck](#ufodeck)
  - [Start server](#start-server)
  - [Ufodeck plan](#ufodeck-plan)


## Start server

```bash
uvicorn src.ufodeck.api:app --reload
## --reload: make the server restart after code changes. Only do this for development.
```

## ufodeck plan

1. Main page template. Buttons: turn on Windows/Linux.
2. Routes:
   1. POST: status machine,
   2. GET: run Windows Linux.
3. FastAPI Client.
Interface ideas:  
https://i.pinimg.com/originals/bc/92/e4/bc92e4718349f3debdcd54821e5bc4bd.jpg  
https://upload.wikimedia.org/wikipedia/commons/f/fe/WP_Space_Ship_Control_Panel.PNG  
https://hackster.imgix.net/uploads/attachments/1233911/feedt3rkiokhb6m_gN9PrsJXzE.jpg?auto=compress%2Cformat&w=830&h=466.875&fit=min&dpr=2.625
https://i.makeagif.com/media/7-30-2015/S1foCk.gif  

Extra:
1. Connect to the local server with ssh.
2. Create front Client.
