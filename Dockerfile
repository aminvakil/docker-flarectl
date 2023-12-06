FROM golang:1.20.12-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.56.0

FROM alpine:3.18.5

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
