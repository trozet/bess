FROM fedora:29
WORKDIR /usr/src/bess
COPY . .
RUN ./build.sh

