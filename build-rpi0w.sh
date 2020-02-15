#!/bin/bash

cd frontend
npm install
npm run build
cd ../http
rice embed-go
cd ..
GOARM=6 GOARCH=arm GOOS=linux go build -ldflags="-s -w" -v -o filebrowser-arm
