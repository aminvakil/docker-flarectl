FROM golang:1.22.8-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.106.0

FROM alpine:3.20.3

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
