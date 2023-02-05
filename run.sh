#!/bin/bash
hatch run uvicorn src.ufodeck.api:app --host 192.168.1.2 --reload