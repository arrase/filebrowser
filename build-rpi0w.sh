#!/bin/bash

go get github.com/GeertJohan/go.rice
go get github.com/GeertJohan/go.rice/rice

cd frontend
npm install
npm run build

cd ../http
rice embed-go

cd ..
go mod download
GOARM=6 GOARCH=arm GOOS=linux go build -ldflags="-s -w" -v -o filebrowser-arm
