
`
# NDVIgnition Docker Environment

GPU-enabled Docker setup for running **WebODM** (photogrammetry) and **HLoc** (feature-matching & SfM)  
for the **NCHC Open Hackathon 2025**.

---

## 📦 Usage

### 1️⃣ Clone this repository
```bash
git clone https://github.com/Smallfu666/NDVIgnition-docker-env.git
cd NDVIgnition-docker-env
```

### 2️⃣ Build containers

```
docker compose build
```

### 3️⃣ Run all services (WebODM + NodeODM + HLoc)

```
docker compose up -d
```

### 4️⃣ Access the WebODM interface

👉 [http://localhost:8000](http://localhost:8000/)

### 5️⃣ (Optional) Enter HLoc container and test CUDA

```
docker exec -it hloc bash
python -c "import torch; print('CUDA:', torch.cuda.is_available())"
```

