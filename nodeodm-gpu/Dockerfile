FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git build-essential cmake pkg-config \
    python3 python3-pip python3-dev \
    libboost-all-dev libeigen3-dev libatlas-base-dev libsuitesparse-dev \
    libgoogle-glog-dev libgflags-dev \
    libopencv-dev \
    libpng-dev libjpeg-dev libtiff-dev libglu1-mesa-dev libglew-dev \
    libgeotiff-dev libproj-dev gdal-bin \
    curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y libceres-dev && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone https://github.com/cdcseacave/openMVS.git && \
    cd openMVS && git submodule update --init --recursive && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DOpenMVS_USE_CUDA=ON -DOpenMVS_USE_OPENMP=ON && \
    make -j"$(nproc)" && make install

RUN git clone https://github.com/OpenDroneMap/NodeODM.git /opt/NodeODM
WORKDIR /opt/NodeODM
RUN npm ci --only=prod || npm install --only=prod

VOLUME ["/datasets"]
EXPOSE 3000

ENV NVIDIA_VISIBLE_DEVICES=all \
    NVIDIA_DRIVER_CAPABILITIES=compute,utility

CMD ["node", "index.js", "--port", "3000", "--odm_options", "--use-opensfm-dense=false"]
