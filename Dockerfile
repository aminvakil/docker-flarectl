FROM golang:1.24.5-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.115.0

FROM alpine:3.22.1

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
