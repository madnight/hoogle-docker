FROM haskell:8
RUN git clone https://github.com/ndmitchell/hoogle.git /root/hoogle
WORKDIR /root/hoogle
RUN cabal update && \
    cabal install --only-dependencies && \
    cabal configure && \
    cabal build && \
    cabal install
RUN hoogle generate
WORKDIR /root
CMD hoogle server -p $PORT
