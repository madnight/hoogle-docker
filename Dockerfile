FROM haskell:8
WORKDIR /
RUN git clone https://github.com/ndmitchell/hoogle.git
WORKDIR /hoogle
RUN apt-get update
RUN cabal update
RUN cabal install --only-dependencies
RUN cabal configure
RUN cabal build
RUN cabal install
RUN hoogle generate
WORKDIR /root
CMD hoogle server -p $PORT
