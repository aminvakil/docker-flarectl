FROM golang:1.19.9-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.56.0

FROM alpine:3.17.3

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
