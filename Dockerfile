FROM golang:1.8.1

WORKDIR /go/src/github.com/ChristopherAparicio/docker/

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .


FROM alpine:latest

#RUN apk --no-cache add ca-certificates
EXPOSE 10000

WORKDIR /app/

COPY --from=0 /go/src/github.com/ChristopherAparicio/docker/main .

CMD ["/app/main"]

#FROM scratch
#ADD main /
#EXPOSE 10000
#CMD ["/main"]