FROM golang:1.17-alpine AS builder

WORKDIR /go/src/app

COPY ./codeeducation.go /go/src/app/

RUN go mod init andrerodri13/codeeducation
RUN go build codeeducation.go

#Uma imagem vazia, especialmente para criar imagens "DO zero"
FROM scratch

COPY --from=builder  /go/src/app/codeeducation .

CMD ["./codeeducation"]

