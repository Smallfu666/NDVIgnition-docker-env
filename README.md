# NDVIgnition Hackathon Docker Environment

Base: `nvcr.io/nvidia/pytorch:24.09-py3`

Includes:
- PyTorch 2.9 + CUDA 12.8
- PyCOLMAP 3.12, HLoc, LightGlue
- OpenCV 4.12, Kornia, h5py
- Optional: OpenDroneMap (ODM) build support

Usage:
```bash
docker build -t ndvignition:hloc .
docker run --gpus all -it ndvignition:hloc
```
