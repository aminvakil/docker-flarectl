FROM golang:1.19.7-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.56.0

FROM alpine:3.17.2

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
