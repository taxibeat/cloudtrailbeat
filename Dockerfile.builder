FROM alpine:3.9.5 as go_alpine_builder

RUN apk add --no-cache git make musl-dev glide bash

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

WORKDIR $GOPATH

# CMD ["make"]


# glide install
# docker run --rm -v ~/go/:/go -w /go/src/github.com/taxibeat/cloudtrailbeat alpine_go bash -c 'glide install && make'

# # Simulate 'go get /github.com/taxibeat/cloudtrailbeat'
# RUN mkdir -p ${GOPATH}/src/github.com/taxibeat/cloudtrailbeat

# # Copy build files
# WORKDIR ${GOPATH}/src/github.com/taxibeat/cloudtrailbeat
# COPY Makefile .
# COPY glide.yaml .
# COPY vendor .
# COPY main.go .
# # Check file existence
# RUN ls -l .

# # Instructions from official README.md 'https://github.com/aidan-/cloudtrailbeat'
# RUN glide install
# RUN make

# # Check existence of binary
# RUN ls -l ./cloudtrailbeat

# FROM scratch AS runtime

# # Create non-root user (Security First!)
# RUN useradd --create-home appuser
# WORKDIR /home/appuser
# USER appuser


# COPY --from=builder /cloudtrailbeat .

# CMD [ "./cloudtrailbeat -b" ]
