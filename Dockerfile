FROM golang:1.22.5-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.98.0

FROM alpine:3.20.1

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
