# Minimal Golang App
This repo aims to explore how to build minimal runtime for golang applications

The final docker image size is:
```shell
docker images | grep goapp
adolphlwq/goapp latest  b2b7723296db    25 seconds ago       2.01MB
```

## Requisites
- Docker 17.05 or higher
- CMake

## Dockerfile
```dockerfile
FROM golang:1.10-alpine as builder
ADD main.go /go/src/goapp/
RUN cd /go/src/goapp/ && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=builder /go/src/goapp/main /
CMD ["/main"]
```

## Reference
- [Build minimal docker container for go applications](https://blog.codeship.com/building-minimal-docker-containers-for-go-applications/)
