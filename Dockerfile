# Sử dụng image C++ cơ bản với Ubuntu
FROM ubuntu:22.04

# Cài đặt các công cụ cần thiết
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

# Cài đặt vcpkg
RUN git clone https://github.com/microsoft/vcpkg.git /vcpkg
WORKDIR /vcpkg
RUN ./bootstrap-vcpkg.sh

# Thiết lập môi trường cho vcpkg
ENV VCPKG_ROOT=/vcpkg
ENV PATH=$VCPKG_ROOT:/vcpkg/installed/x64-linux/bin:$PATH

# Cài đặt Google Test qua vcpkg
RUN /vcpkg/vcpkg install gtest

# Sao chép mã nguồn vào container
WORKDIR /app
COPY . /app

# Build project 
RUN mkdir build && cd build && cmake .. && cmake --build .

# Chạy ứng dụng
CMD ["/app/build/tests/unit-test/unit-test"]
