# Build
FROM golang:1.19 as build
WORKDIR /app
COPY hello.go .
COPY go.mod .
RUN go build

# RUN
FROM scratch
COPY --from=build /app /
ENTRYPOINT [ "./hello" ]