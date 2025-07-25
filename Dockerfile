FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY ./app/main.go .
RUN go build -o app main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]
