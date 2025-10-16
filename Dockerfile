# Base image: NVIDIA official PyTorch container (CUDA 12.4, Python 3)
FROM nvcr.io/nvidia/pytorch:24.09-py3

LABEL maintainer="NDVIgnition Team <Smallfu666>"

# ===== System dependencies =====
RUN apt-get update && apt-get install -y \
    git wget unzip cmake build-essential python3-opencv && \
    rm -rf /var/lib/apt/lists/*

# ===== Python dependencies =====
RUN pip install --no-cache-dir \
    torch torchvision kornia h5py pycolmap \
    opencv-python lightglue && \
    pip install --no-cache-dir git+https://github.com/cvg/Hierarchical-Localization@master

# ===== Optional: for WebODM / OpenDroneMap integration =====
RUN apt-get update && apt-get install -y gdal-bin python3-gdal && \
    pip install opendronemap && \
    rm -rf /var/lib/apt/lists/*

# ===== Set up workspace =====
WORKDIR /workspace
ENV PYTHONUNBUFFERED=1

# ===== Test GPU visibility =====
CMD ["python3", "-c", "import torch; print('CUDA:', torch.cuda.is_available(), 'Device:', torch.cuda.get_device_name(0) if torch.cuda.is_available() else 'None')"]
