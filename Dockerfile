FROM diuis/docker-ubuntu-wget_nodejs_python:18.10

ARG EMSDK_ARCHIVE=https://github.com/emscripten-core/emscripten/archive/1.38.34.zip

RUN apt-get update && apt-get install --no-install-recommends -y make cmake g++ gcc git openjdk-8-jdk && \
    apt-get autoremove && apt-get clean

USER appuser
RUN wget -nv ${EMSDK_ARCHIVE} -O /home/appuser/emsdk.tar && \
    mkdir /home/appuser/emsdk && \
    tar xf /home/appuser/emsdk.tar -C /home/appuser/emsdk --strip-components 1 && \
    rm /home/appuser/emsdk.tar

