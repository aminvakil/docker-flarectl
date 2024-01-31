FROM golang:1.20.13-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.87.0

FROM alpine:3.19.1

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
