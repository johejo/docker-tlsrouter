FROM golang:1.20 as builder

ENV CGO_ENABLED=0
RUN go install inet.af/tcpproxy/cmd/tlsrouter@latest

FROM gcr.io/distroless/static-debian11
COPY --from=builder /go/bin/tlsrouter /usr/local/bin/tlsrouter
ENTRYPOINT ["tlsrouter"]
CMD ["-h"]
