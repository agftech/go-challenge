FROM golang:alpine AS builder

WORKDIR /go/src/go-challenge/src
COPY ./src/main.go .
RUN GOOS=linux go build -ldflags="-w -s"
# RUN GOOS=linux go build -ldflags="-w -s" -o /go/src/go-challenge/src

FROM scratch
# WORKDIR /go/src
COPY --from=builder  /go/src/go-challenge/src .
ENTRYPOINT [ "./src" ]
