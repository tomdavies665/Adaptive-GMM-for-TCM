# Adaptive-GMM-for-TCM

This repository contains the Quartus project and source files for the Adaptive Gaussian Mixture Model (GMM) implemented on an FPGA for Tool Condition Monitoring (TCM).

## Prerequisites

* **Software:** Intel Quartus Prime Lite Edition (Designed and tested on version **23.1 STD**).
* **Hardware:** Custom PCB featuring the Intel MAX 10 FPGA (`10M50SAE144C8G`).
* **Tools:** USB Blaster / JTAG programmer and a 6V to 3.5V power supply or battery.

---

## Opening the Project

1. **Download the Repository:** Download and unzip the repository to your local machine. 
   > **Note:** Quartus can sometimes encounter pathing issues with cloud-synced folders (like OneDrive). For the best stability, extract the repository directly to your `C:\` drive (e.g., `C:\FPGA_Projects\Adaptive-GMM-for-TCM`).
2. **Launch Quartus:** Open Intel Quartus Prime Lite 23.1 STD.
3. **Open Project:** Go to `File > Open Project...` and select the **`GaussianMixtureModel.qpf`** project file.

---

## Flashing the PCB Prototype

To program the device permanently so it retains the code after a power cycle, follow these steps:

1. **Verify Device:** Ensure your target device in Quartus is set to `10M50SAE144C8G`.
2. **Hardware Setup:** Connect the JTAG programmer to the board's JTAG header. Ensure the board is powered on and receiving **6V to 3.7V**.
3. **Open Programmer:** In Quartus, open the Programmer tool (`Tools > Programmer`).
4. **Hardware Setup:** Click **Hardware Setup...** and ensure your computer recognizes the JTAG USB device. Select it from the drop-down menu and close the setup window.
5. **Select File:** Click **Add File...** (or Change File), navigate to the `output_files/` directory, and select **`GaussianMixtureModel.pof`**.
   > *Note: Using the `.pof` (Programmer Object File) instead of the `.sof` flashes the non-volatile memory, ensuring the device does not need to be reprogrammed every time it is power-cycled.*
6. **Configure Programmer:** 
   * You should see 3 files/partitions appear in the programming window.
   * Check the **Program/Configure** and **Verify** boxes for **all 3 files**.
   * Ensure that **Enable real-time ISP to allow background programming** is **UNCHECKED**.
7. **Flash:** Click the **Start** button to program the device. 

---

## Device Operation

Once programmed and powered, the device operates as follows:

* **Reset & Training:** Pressing the onboard button will trigger a system reset and immediately switch the device into its training phase.
* **Status Indication:** The onboard LEDs indicate the current health status determined by the tool.
* **Debugging:** There are 4 dedicated output pins available on the board for probing and debugging signals.
* **Modifying Behavior:** To change the core behavior and operational parameters of the device, you will need to edit the top-level entity file in the Quartus project and recompile.
