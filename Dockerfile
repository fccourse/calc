FROM golang:1.22.0 AS builder

WORKDIR /app

COPY . .

RUN go build -o math

FROM debian:bookworm-slim AS runtime

WORKDIR /app

COPY --from=builder /app/math .

ENTRYPOINT ["./math"]
