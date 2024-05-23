FROM golang:1.22.3-alpine AS builder

RUN go install github.com/cloudflare/cloudflare-go/cmd/flarectl@v0.93.0

FROM alpine:3.20.0

COPY --from=builder /go/bin/flarectl /usr/bin/flarectl

ENTRYPOINT ["flarectl"]
