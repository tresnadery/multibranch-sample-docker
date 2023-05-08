FROM golang:latest

WORKDIR /go/src/project/

COPY . .

RUN go mod tidy

RUN go run main.go