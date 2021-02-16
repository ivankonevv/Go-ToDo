FROM golang:1.15.7-buster

RUN go version
ENV GOPATH=/

COPY ./ ./

RUN apt-get update
RUN apt-get -y install postgresql-client

RUN chmod +x wait_for_postgres.sh

RUN go mod download
RUN go build -o todo-app ./cmd/main.go

CMD ["./todo-app"]