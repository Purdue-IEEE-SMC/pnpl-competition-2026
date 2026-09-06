import sys
import h5py
import mne
import numpy as np
import pandas as pd
import pnpl
import torch

print(f"Python: {sys.version.split()[0]}")
print(f"PyTorch: {torch.__version__}")
print(f"CUDA available: {torch.cuda.is_available()}")
if torch.cuda.is_available():
    print(f"GPU: {torch.cuda.get_device_name(0)}")
print(f"NumPy: {np.__version__}")
print(f"pandas: {pd.__version__}")
print(f"MNE: {mne.__version__}")
print(f"h5py: {h5py.__version__}")
print("PNPL imported successfully")
print("Environment ready")
