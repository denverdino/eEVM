FROM ubuntu:xenial
MAINTAINER Li Yi <denverdino@gmail.com>
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list
RUN apt-get update && apt-get install -yq --no-install-recommends ca-certificates build-essential g++ libboost-all-dev ninja-build curl wget git 
RUN wget https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz && tar -xf boost_1_67_0.tar.gz
RUN wget https://github.com/Kitware/CMake/releases/download/v3.13.0/cmake-3.13.0-Linux-x86_64.sh && chmod +x cmake-3.13.0-Linux-x86_64.sh && ./cmake-3.13.0-Linux-x86_64.sh --skip-licensep
RUN git clone https://github.com/Microsoft/eEVM
RUN cd eEVM && mkdir build && cd build && BOOST_ROOT=../boost_1_67_0/ cmake .. && make && make test
