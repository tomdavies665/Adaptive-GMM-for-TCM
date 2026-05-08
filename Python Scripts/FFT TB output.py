import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# 1. Read the simulation output
try:
    df = pd.read_csv('fft_output.csv')
except FileNotFoundError:
    print("Error: 'fft_output.csv' not found. Did the ModelSim simulation finish?")
    exit()

# 2. Extract arrays and FORCE TO FLOAT64 to prevent 26-bit integer overflow
real_vals = df['Real'].values.astype(np.float64)
imag_vals = df['Imag'].values.astype(np.float64)

# 3. Calculate True Magnitude
# Magnitude = sqrt(Real^2 + Imag^2)
magnitude = np.sqrt(real_vals**2 + imag_vals**2)

# 4. Generate Frequency Axis
fs = 5000000.0   # 5 MHz

# FIX: Dynamically read N from the CSV so the x and y axes always match perfectly
N = len(df)      
print(f"Loaded {N} FFT bins from simulation.")

freqs = np.fft.fftfreq(N, 1/fs)

# Keep only the positive frequencies (the first half of the FFT output)
half_N = N // 2
freqs_pos = freqs[:half_N]
mag_pos = magnitude[:half_N]

# 5. Plot the Spectrum
plt.figure(figsize=(10, 5))
plt.plot(freqs_pos, mag_pos, color='green', linewidth=1.5)

# 6. Formatting
plt.title("FPGA Simulation FFT Output (1024-Point, Natural Word Growth)")
plt.xlabel("Frequency (Hz)")
plt.ylabel("Magnitude (Raw 26-bit)") # Updated to 26-bit
plt.grid(True, alpha=0.3)

# Optional: Add annotations for the expected peaks
f1 = 150000.0    # 150 kHz
f2 = 800000.0    # 800 kHz
plt.axvline(f1, color='r', linestyle='--', label=f'Expected {f1/1000} kHz', alpha=0.7)
plt.axvline(f2, color='b', linestyle='--', label=f'Expected {f2/1000} kHz', alpha=0.7)

plt.legend()
plt.tight_layout()
plt.show()