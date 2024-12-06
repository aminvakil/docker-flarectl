FROM golang:1.23.4-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.111.0

FROM alpine:3.21.0

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
