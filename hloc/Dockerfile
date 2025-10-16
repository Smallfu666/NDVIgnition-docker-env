FROM nvcr.io/nvidia/pytorch:24.09-py3

RUN apt-get update && apt-get install -y \
    git wget unzip cmake build-essential \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    kornia h5py pycolmap opencv-python \
 && pip install --no-cache-dir git+https://github.com/cvg/LightGlue \
 && pip install --no-cache-dir git+https://github.com/cvg/Hierarchical-Localization@master

WORKDIR /workspace
ENV PYTHONUNBUFFERED=1

CMD ["python", "-c", "import torch;print('CUDA:',torch.cuda.is_available(),'; device=',torch.cuda.get_device_name(0) if torch.cuda.is_available() else 'None')"]
