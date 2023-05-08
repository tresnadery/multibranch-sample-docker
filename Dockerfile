FROM golang:latest

WORKDIR /go/src/project/

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux go build -o /pipeline-golang

EXPOSE 1323

CMD ["/pipeline-golang"]
