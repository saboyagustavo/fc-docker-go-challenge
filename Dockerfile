FROM golang:alpine AS build

WORKDIR /usr/src/app

COPY app/ .

RUN go build -o /go/rocks

CMD ["/go/rocks"]

FROM scratch

COPY --from=build /go/rocks /go/rocks

CMD ["/go/rocks"]