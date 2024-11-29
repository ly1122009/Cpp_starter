# Using ubuntu 22.04 image 
FROM ubuntu:22.04

# Setup some necessary tools 
RUN apt-get update && apt-get install -y \
    g++ \
    cmake \
    make \
    git \
    zip \
    unzip \
    curl \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Setup vcpkg
RUN git clone https://github.com/microsoft/vcpkg.git /vcpkg
WORKDIR /vcpkg
RUN ./bootstrap-vcpkg.sh

# Config the environment for vcpkg
ENV VCPKG_ROOT=/vcpkg
ENV PATH=$VCPKG_ROOT:/vcpkg/installed/x64-linux/bin:$PATH

# Setup GTest by using vcpkg
RUN /vcpkg/vcpkg install gtest

# Copy source code and paste them into containers
WORKDIR /app
COPY . /app

# Build project 
RUN mkdir build && cd build && cmake .. && cmake --build .

# Run application
CMD ["/app/build/tests/unit-test/unit-test"]
