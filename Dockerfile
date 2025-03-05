FROM golang:1.24.1-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.115.0

FROM alpine:3.21.3

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
