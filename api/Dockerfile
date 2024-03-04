FROM golang:1.22-alpine AS builder

########
# Prep
########

# add the source
COPY . /api
WORKDIR /api/

########
# Build Go Wrapper
########

# Install go dependencies
RUN go get github.com/gorilla/mux && \
  go get github.com/gorilla/handlers && \
  go get github.com/lib/pq && \
  go get github.com/joho/godotenv && \
  go get github.com/jinzhu/gorm && \
  go get github.com/go-goracle/goracle && \
  go get github.com/cosmtrek/air@latest && \
  go get github.com/gin-gonic/gin

#build the go app
RUN GOOS=linux GOARCH=amd64 go build -o ./api ./main.go

########
# Package into runtime image
########
FROM alpine

# copy the executable from the builder image
COPY --from=builder /api .

ENTRYPOINT ["/api"]
