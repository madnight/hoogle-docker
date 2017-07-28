FROM ubuntu:16.04
RUN apt-get update && apt-get install -y hoogle
RUN hoogle generate
CMD hoogle server -p $PORT
