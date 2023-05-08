FROM golang:latest

RUN go mod tidy

RUN go build