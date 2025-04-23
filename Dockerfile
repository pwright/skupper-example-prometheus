FROM golang:1.22

WORKDIR /app

COPY simple-prom-metrics.go .
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY .  .
RUN make build

WORKDIR /app
CMD ["/app/simple-prom-metrics"]
