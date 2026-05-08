-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 23.1std (Release Build #993)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2024 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from cordic_CORDIC_0
-- VHDL created on Thu Apr 23 11:16:17 2026


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity cordic_CORDIC_0 is
    port (
        x : in std_logic_vector(12 downto 0);  -- sfix13
        y : in std_logic_vector(12 downto 0);  -- sfix13
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(13 downto 0);  -- sfix14_en11
        r : out std_logic_vector(13 downto 0);  -- ufix14
        clk : in std_logic;
        areset : in std_logic
    );
end cordic_CORDIC_0;

architecture normal of cordic_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_vecTranslateTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal signX_uid7_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid8_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid9_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absXE_uid10_vecTranslateTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal absXE_uid10_vecTranslateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal absXE_uid10_vecTranslateTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal absXE_uid10_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absXE_uid10_vecTranslateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal invSignY_uid11_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absYE_uid12_vecTranslateTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal absYE_uid12_vecTranslateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal absYE_uid12_vecTranslateTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal absYE_uid12_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absYE_uid12_vecTranslateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal absX_uid13_vecTranslateTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal absX_uid13_vecTranslateTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal absY_uid14_vecTranslateTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal absY_uid14_vecTranslateTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal yNotZero_uid15_vecTranslateTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotZero_uid15_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yZero_uid16_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid17_vecTranslateTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid17_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xZero_uid18_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_1_uid23_vecTranslateTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_1_uid23_vecTranslateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_1_uid23_vecTranslateTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_1_uid23_vecTranslateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1E_1_uid24_vecTranslateTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1E_1_uid24_vecTranslateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1E_1_uid24_vecTranslateTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1E_1_uid24_vecTranslateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xMSB_uid32_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignOfSelectionSignal_uid37_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2NA_uid39_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2sumAHighB_uid40_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_2NA_uid42_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2sumAHighB_uid43_vecTranslateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_2_uid48_vecTranslateTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1_2_uid48_vecTranslateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal yip1_2_uid49_vecTranslateTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal yip1_2_uid49_vecTranslateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xMSB_uid51_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignOfSelectionSignal_uid56_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3CostZeroPaddingA_uid57_vecTranslateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal xip1E_3NA_uid58_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3sumAHighB_uid59_vecTranslateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_3NA_uid61_vecTranslateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3sumAHighB_uid62_vecTranslateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_3_uid67_vecTranslateTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1_3_uid67_vecTranslateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1_3_uid68_vecTranslateTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1_3_uid68_vecTranslateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xMSB_uid70_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignOfSelectionSignal_uid75_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4CostZeroPaddingA_uid76_vecTranslateTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal xip1E_4NA_uid77_vecTranslateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_o : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4sumAHighB_uid78_vecTranslateTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_4NA_uid80_vecTranslateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4sumAHighB_uid81_vecTranslateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_4_uid86_vecTranslateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_4_uid86_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_4_uid87_vecTranslateTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1_4_uid87_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid89_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignOfSelectionSignal_uid94_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal xip1E_5NA_uid96_vecTranslateTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5sumAHighB_uid97_vecTranslateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_5NA_uid99_vecTranslateTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5sumAHighB_uid100_vecTranslateTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_5_uid105_vecTranslateTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_5_uid105_vecTranslateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1_5_uid106_vecTranslateTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1_5_uid106_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xMSB_uid108_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid112_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal twoToMiSiYip_uid113_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal invSignOfSelectionSignal_uid115_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6NA_uid117_vecTranslateTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1E_6sumAHighB_uid118_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_6sumAHighB_uid118_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_6sumAHighB_uid118_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_6sumAHighB_uid118_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6sumAHighB_uid118_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_6NA_uid120_vecTranslateTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6sumAHighB_uid121_vecTranslateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_6sumAHighB_uid121_vecTranslateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_6sumAHighB_uid121_vecTranslateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_6sumAHighB_uid121_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6sumAHighB_uid121_vecTranslateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_6_uid126_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_6_uid126_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_6_uid127_vecTranslateTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1_6_uid127_vecTranslateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal xMSB_uid129_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid133_vecTranslateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal twoToMiSiYip_uid134_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal invSignOfSelectionSignal_uid136_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid137_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_7_uid137_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_7_uid137_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_7_uid137_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid137_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_7_uid138_vecTranslateTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_7_uid138_vecTranslateTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_7_uid138_vecTranslateTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_7_uid138_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid138_vecTranslateTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_7_uid143_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_7_uid143_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_7_uid144_vecTranslateTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_7_uid144_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xMSB_uid146_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid150_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal twoToMiSiYip_uid151_vecTranslateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal invSignOfSelectionSignal_uid153_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid154_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_8_uid154_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_8_uid154_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_8_uid154_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid154_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_8_uid155_vecTranslateTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_8_uid155_vecTranslateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_8_uid155_vecTranslateTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_8_uid155_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid155_vecTranslateTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_8_uid160_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_8_uid160_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_8_uid161_vecTranslateTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1_8_uid161_vecTranslateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xMSB_uid163_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid167_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid168_vecTranslateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal invSignOfSelectionSignal_uid170_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid171_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_9_uid171_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_9_uid171_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_9_uid171_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid171_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_9_uid172_vecTranslateTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_9_uid172_vecTranslateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_9_uid172_vecTranslateTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_9_uid172_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid172_vecTranslateTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_9_uid177_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_9_uid177_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_9_uid178_vecTranslateTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1_9_uid178_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xMSB_uid180_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid184_vecTranslateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal twoToMiSiYip_uid185_vecTranslateTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal invSignOfSelectionSignal_uid187_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid188_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_10_uid188_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_10_uid188_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_10_uid188_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid188_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_10_uid189_vecTranslateTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_10_uid189_vecTranslateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_10_uid189_vecTranslateTest_o : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_10_uid189_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid189_vecTranslateTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_10_uid194_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_10_uid194_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_10_uid195_vecTranslateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_10_uid195_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid197_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid201_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal twoToMiSiYip_uid202_vecTranslateTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal invSignOfSelectionSignal_uid204_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid205_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_11_uid205_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_11_uid205_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_11_uid205_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid205_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_11_uid206_vecTranslateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_11_uid206_vecTranslateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_11_uid206_vecTranslateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_11_uid206_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid206_vecTranslateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_11_uid211_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_11_uid211_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_11_uid212_vecTranslateTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1_11_uid212_vecTranslateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xMSB_uid214_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid218_vecTranslateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal twoToMiSiYip_uid219_vecTranslateTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal invSignOfSelectionSignal_uid221_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid222_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_12_uid222_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_12_uid222_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_12_uid222_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid222_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_12_uid223_vecTranslateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_12_uid223_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_12_uid223_vecTranslateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_12_uid223_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_12_uid223_vecTranslateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_12_uid228_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_12_uid228_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_12_uid229_vecTranslateTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1_12_uid229_vecTranslateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid231_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid235_vecTranslateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal twoToMiSiYip_uid236_vecTranslateTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal invSignOfSelectionSignal_uid238_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid239_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_13_uid239_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_13_uid239_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_13_uid239_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid239_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_13_uid240_vecTranslateTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_13_uid240_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_13_uid240_vecTranslateTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_13_uid240_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_13_uid240_vecTranslateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_13_uid245_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_13_uid245_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_13_uid246_vecTranslateTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1_13_uid246_vecTranslateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xMSB_uid248_vecTranslateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiYip_uid253_vecTranslateTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal invSignOfSelectionSignal_uid255_vecTranslateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid256_vecTranslateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_14_uid256_vecTranslateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_14_uid256_vecTranslateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_14_uid256_vecTranslateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid256_vecTranslateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1_14_uid262_vecTranslateTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_14_uid262_vecTranslateTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal concSignVector_uid265_vecTranslateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal table_l3_uid267_vecTranslateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal table_l7_uid271_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal table_l11_uid275_vecTranslateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal table_l13_uid279_vecTranslateTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal lev1_a0_uid282_vecTranslateTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal lev1_a0_uid282_vecTranslateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal lev1_a0_uid282_vecTranslateTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal lev1_a0_uid282_vecTranslateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal lev1_a1_uid283_vecTranslateTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal lev1_a1_uid283_vecTranslateTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal lev1_a1_uid283_vecTranslateTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal lev1_a1_uid283_vecTranslateTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal lev2_a0_uid284_vecTranslateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal lev2_a0_uid284_vecTranslateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal lev2_a0_uid284_vecTranslateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal lev2_a0_uid284_vecTranslateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal atanRes_uid285_vecTranslateTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal atanRes_uid285_vecTranslateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal cstZeroOutFormat_uid286_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal constPiP2uE_uid287_vecTranslateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal constPio2P2u_mergedSignalTM_uid290_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal concXZeroYZero_uid292_vecTranslateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal atanResPostExc_uid293_vecTranslateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal atanResPostExc_uid293_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal concSigns_uid294_vecTranslateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal constPiP2u_uid295_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal constPi_uid296_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal constantZeroOutFormat_uid297_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal constantZeroOutFormatP2u_uid298_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal firstOperand_uid300_vecTranslateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal firstOperand_uid300_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal secondOperand_uid301_vecTranslateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal secondOperand_uid301_vecTranslateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal outResExtended_uid302_vecTranslateTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal outResExtended_uid302_vecTranslateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal outResExtended_uid302_vecTranslateTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal outResExtended_uid302_vecTranslateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal atanResPostRR_uid303_vecTranslateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal outMagPreRnd_uid305_vecTranslateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal outMagPostRnd_uid308_vecTranslateTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal outMagPostRnd_uid308_vecTranslateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal outMagPostRnd_uid308_vecTranslateTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal outMagPostRnd_uid308_vecTranslateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal outMag_uid309_vecTranslateTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal outMag_uid309_vecTranslateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal is0_uid266_vecTranslateTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal is0_uid266_vecTranslateTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal is0_uid266_vecTranslateTest_merged_bit_select_d : STD_LOGIC_VECTOR (3 downto 0);
    signal is0_uid266_vecTranslateTest_merged_bit_select_e : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_twoToMiSiYip_uid253_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_xMSB_uid248_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_xip1_13_uid245_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist3_xMSB_uid231_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_xMSB_uid214_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_xMSB_uid197_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_xMSB_uid180_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_yip1_9_uid178_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal redist8_xip1_9_uid177_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist9_xMSB_uid163_vecTranslateTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_xMSB_uid146_vecTranslateTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_xMSB_uid129_vecTranslateTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_xMSB_uid108_vecTranslateTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_xMSB_uid89_vecTranslateTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_yip1_4_uid87_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist15_xip1_4_uid86_vecTranslateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist16_xMSB_uid70_vecTranslateTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_xMSB_uid51_vecTranslateTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_xMSB_uid32_vecTranslateTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_xNotZero_uid17_vecTranslateTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yNotZero_uid15_vecTranslateTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_signY_uid8_vecTranslateTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_signX_uid7_vecTranslateTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- xMSB_uid231_vecTranslateTest(BITSELECT,230)@2
    xMSB_uid231_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_12_uid229_vecTranslateTest_b(17 downto 17));

    -- xMSB_uid197_vecTranslateTest(BITSELECT,196)@2
    xMSB_uid197_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_10_uid195_vecTranslateTest_b(19 downto 19));

    -- xMSB_uid163_vecTranslateTest(BITSELECT,162)@1
    xMSB_uid163_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_8_uid161_vecTranslateTest_b(21 downto 21));

    -- xMSB_uid129_vecTranslateTest(BITSELECT,128)@1
    xMSB_uid129_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_6_uid127_vecTranslateTest_b(23 downto 23));

    -- signX_uid7_vecTranslateTest(BITSELECT,6)@0
    signX_uid7_vecTranslateTest_b <= STD_LOGIC_VECTOR(x(12 downto 12));

    -- invSignX_uid9_vecTranslateTest(LOGICAL,8)@0
    invSignX_uid9_vecTranslateTest_q <= not (signX_uid7_vecTranslateTest_b);

    -- constantZero_uid6_vecTranslateTest(CONSTANT,5)
    constantZero_uid6_vecTranslateTest_q <= "0000000000000";

    -- absXE_uid10_vecTranslateTest(ADDSUB,9)@0
    absXE_uid10_vecTranslateTest_s <= invSignX_uid9_vecTranslateTest_q;
    absXE_uid10_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => constantZero_uid6_vecTranslateTest_q(12)) & constantZero_uid6_vecTranslateTest_q));
    absXE_uid10_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => x(12)) & x));
    absXE_uid10_vecTranslateTest_combproc: PROCESS (absXE_uid10_vecTranslateTest_a, absXE_uid10_vecTranslateTest_b, absXE_uid10_vecTranslateTest_s)
    BEGIN
        IF (absXE_uid10_vecTranslateTest_s = "1") THEN
            absXE_uid10_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(absXE_uid10_vecTranslateTest_a) + SIGNED(absXE_uid10_vecTranslateTest_b));
        ELSE
            absXE_uid10_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(absXE_uid10_vecTranslateTest_a) - SIGNED(absXE_uid10_vecTranslateTest_b));
        END IF;
    END PROCESS;
    absXE_uid10_vecTranslateTest_q <= absXE_uid10_vecTranslateTest_o(13 downto 0);

    -- absX_uid13_vecTranslateTest(BITSELECT,12)@0
    absX_uid13_vecTranslateTest_in <= absXE_uid10_vecTranslateTest_q(12 downto 0);
    absX_uid13_vecTranslateTest_b <= absX_uid13_vecTranslateTest_in(12 downto 0);

    -- signY_uid8_vecTranslateTest(BITSELECT,7)@0
    signY_uid8_vecTranslateTest_b <= STD_LOGIC_VECTOR(y(12 downto 12));

    -- invSignY_uid11_vecTranslateTest(LOGICAL,10)@0
    invSignY_uid11_vecTranslateTest_q <= not (signY_uid8_vecTranslateTest_b);

    -- absYE_uid12_vecTranslateTest(ADDSUB,11)@0
    absYE_uid12_vecTranslateTest_s <= invSignY_uid11_vecTranslateTest_q;
    absYE_uid12_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => constantZero_uid6_vecTranslateTest_q(12)) & constantZero_uid6_vecTranslateTest_q));
    absYE_uid12_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => y(12)) & y));
    absYE_uid12_vecTranslateTest_combproc: PROCESS (absYE_uid12_vecTranslateTest_a, absYE_uid12_vecTranslateTest_b, absYE_uid12_vecTranslateTest_s)
    BEGIN
        IF (absYE_uid12_vecTranslateTest_s = "1") THEN
            absYE_uid12_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(absYE_uid12_vecTranslateTest_a) + SIGNED(absYE_uid12_vecTranslateTest_b));
        ELSE
            absYE_uid12_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(absYE_uid12_vecTranslateTest_a) - SIGNED(absYE_uid12_vecTranslateTest_b));
        END IF;
    END PROCESS;
    absYE_uid12_vecTranslateTest_q <= absYE_uid12_vecTranslateTest_o(13 downto 0);

    -- absY_uid14_vecTranslateTest(BITSELECT,13)@0
    absY_uid14_vecTranslateTest_in <= absYE_uid12_vecTranslateTest_q(12 downto 0);
    absY_uid14_vecTranslateTest_b <= absY_uid14_vecTranslateTest_in(12 downto 0);

    -- yip1E_1_uid24_vecTranslateTest(SUB,23)@0
    yip1E_1_uid24_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & absY_uid14_vecTranslateTest_b);
    yip1E_1_uid24_vecTranslateTest_b <= STD_LOGIC_VECTOR("0" & absX_uid13_vecTranslateTest_b);
    yip1E_1_uid24_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1_uid24_vecTranslateTest_a) - UNSIGNED(yip1E_1_uid24_vecTranslateTest_b));
    yip1E_1_uid24_vecTranslateTest_q <= yip1E_1_uid24_vecTranslateTest_o(13 downto 0);

    -- xMSB_uid32_vecTranslateTest(BITSELECT,31)@0
    xMSB_uid32_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1E_1_uid24_vecTranslateTest_q(13 downto 13));

    -- xip1E_1_uid23_vecTranslateTest(ADD,22)@0
    xip1E_1_uid23_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & absX_uid13_vecTranslateTest_b);
    xip1E_1_uid23_vecTranslateTest_b <= STD_LOGIC_VECTOR("0" & absY_uid14_vecTranslateTest_b);
    xip1E_1_uid23_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xip1E_1_uid23_vecTranslateTest_a) + UNSIGNED(xip1E_1_uid23_vecTranslateTest_b));
    xip1E_1_uid23_vecTranslateTest_q <= xip1E_1_uid23_vecTranslateTest_o(13 downto 0);

    -- yip1E_2NA_uid42_vecTranslateTest(BITJOIN,41)@0
    yip1E_2NA_uid42_vecTranslateTest_q <= yip1E_1_uid24_vecTranslateTest_q & GND_q;

    -- yip1E_2sumAHighB_uid43_vecTranslateTest(ADDSUB,42)@0
    yip1E_2sumAHighB_uid43_vecTranslateTest_s <= xMSB_uid32_vecTranslateTest_b;
    yip1E_2sumAHighB_uid43_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => yip1E_2NA_uid42_vecTranslateTest_q(14)) & yip1E_2NA_uid42_vecTranslateTest_q));
    yip1E_2sumAHighB_uid43_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_1_uid23_vecTranslateTest_q));
    yip1E_2sumAHighB_uid43_vecTranslateTest_combproc: PROCESS (yip1E_2sumAHighB_uid43_vecTranslateTest_a, yip1E_2sumAHighB_uid43_vecTranslateTest_b, yip1E_2sumAHighB_uid43_vecTranslateTest_s)
    BEGIN
        IF (yip1E_2sumAHighB_uid43_vecTranslateTest_s = "1") THEN
            yip1E_2sumAHighB_uid43_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid43_vecTranslateTest_a) + SIGNED(yip1E_2sumAHighB_uid43_vecTranslateTest_b));
        ELSE
            yip1E_2sumAHighB_uid43_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid43_vecTranslateTest_a) - SIGNED(yip1E_2sumAHighB_uid43_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_2sumAHighB_uid43_vecTranslateTest_q <= yip1E_2sumAHighB_uid43_vecTranslateTest_o(15 downto 0);

    -- yip1_2_uid49_vecTranslateTest(BITSELECT,48)@0
    yip1_2_uid49_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_2sumAHighB_uid43_vecTranslateTest_q(14 downto 0));
    yip1_2_uid49_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_2_uid49_vecTranslateTest_in(14 downto 0));

    -- xMSB_uid51_vecTranslateTest(BITSELECT,50)@0
    xMSB_uid51_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_2_uid49_vecTranslateTest_b(14 downto 14));

    -- invSignOfSelectionSignal_uid37_vecTranslateTest(LOGICAL,36)@0
    invSignOfSelectionSignal_uid37_vecTranslateTest_q <= not (xMSB_uid32_vecTranslateTest_b);

    -- xip1E_2NA_uid39_vecTranslateTest(BITJOIN,38)@0
    xip1E_2NA_uid39_vecTranslateTest_q <= xip1E_1_uid23_vecTranslateTest_q & GND_q;

    -- xip1E_2sumAHighB_uid40_vecTranslateTest(ADDSUB,39)@0
    xip1E_2sumAHighB_uid40_vecTranslateTest_s <= invSignOfSelectionSignal_uid37_vecTranslateTest_q;
    xip1E_2sumAHighB_uid40_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_2NA_uid39_vecTranslateTest_q));
    xip1E_2sumAHighB_uid40_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 14 => yip1E_1_uid24_vecTranslateTest_q(13)) & yip1E_1_uid24_vecTranslateTest_q));
    xip1E_2sumAHighB_uid40_vecTranslateTest_combproc: PROCESS (xip1E_2sumAHighB_uid40_vecTranslateTest_a, xip1E_2sumAHighB_uid40_vecTranslateTest_b, xip1E_2sumAHighB_uid40_vecTranslateTest_s)
    BEGIN
        IF (xip1E_2sumAHighB_uid40_vecTranslateTest_s = "1") THEN
            xip1E_2sumAHighB_uid40_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid40_vecTranslateTest_a) + SIGNED(xip1E_2sumAHighB_uid40_vecTranslateTest_b));
        ELSE
            xip1E_2sumAHighB_uid40_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid40_vecTranslateTest_a) - SIGNED(xip1E_2sumAHighB_uid40_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_2sumAHighB_uid40_vecTranslateTest_q <= xip1E_2sumAHighB_uid40_vecTranslateTest_o(16 downto 0);

    -- xip1_2_uid48_vecTranslateTest(BITSELECT,47)@0
    xip1_2_uid48_vecTranslateTest_in <= xip1E_2sumAHighB_uid40_vecTranslateTest_q(14 downto 0);
    xip1_2_uid48_vecTranslateTest_b <= xip1_2_uid48_vecTranslateTest_in(14 downto 0);

    -- xip1E_3CostZeroPaddingA_uid57_vecTranslateTest(CONSTANT,56)
    xip1E_3CostZeroPaddingA_uid57_vecTranslateTest_q <= "00";

    -- yip1E_3NA_uid61_vecTranslateTest(BITJOIN,60)@0
    yip1E_3NA_uid61_vecTranslateTest_q <= yip1_2_uid49_vecTranslateTest_b & xip1E_3CostZeroPaddingA_uid57_vecTranslateTest_q;

    -- yip1E_3sumAHighB_uid62_vecTranslateTest(ADDSUB,61)@0
    yip1E_3sumAHighB_uid62_vecTranslateTest_s <= xMSB_uid51_vecTranslateTest_b;
    yip1E_3sumAHighB_uid62_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => yip1E_3NA_uid61_vecTranslateTest_q(16)) & yip1E_3NA_uid61_vecTranslateTest_q));
    yip1E_3sumAHighB_uid62_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & xip1_2_uid48_vecTranslateTest_b));
    yip1E_3sumAHighB_uid62_vecTranslateTest_combproc: PROCESS (yip1E_3sumAHighB_uid62_vecTranslateTest_a, yip1E_3sumAHighB_uid62_vecTranslateTest_b, yip1E_3sumAHighB_uid62_vecTranslateTest_s)
    BEGIN
        IF (yip1E_3sumAHighB_uid62_vecTranslateTest_s = "1") THEN
            yip1E_3sumAHighB_uid62_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid62_vecTranslateTest_a) + SIGNED(yip1E_3sumAHighB_uid62_vecTranslateTest_b));
        ELSE
            yip1E_3sumAHighB_uid62_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid62_vecTranslateTest_a) - SIGNED(yip1E_3sumAHighB_uid62_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_3sumAHighB_uid62_vecTranslateTest_q <= yip1E_3sumAHighB_uid62_vecTranslateTest_o(17 downto 0);

    -- yip1_3_uid68_vecTranslateTest(BITSELECT,67)@0
    yip1_3_uid68_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_3sumAHighB_uid62_vecTranslateTest_q(15 downto 0));
    yip1_3_uid68_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_3_uid68_vecTranslateTest_in(15 downto 0));

    -- xMSB_uid70_vecTranslateTest(BITSELECT,69)@0
    xMSB_uid70_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_3_uid68_vecTranslateTest_b(15 downto 15));

    -- invSignOfSelectionSignal_uid56_vecTranslateTest(LOGICAL,55)@0
    invSignOfSelectionSignal_uid56_vecTranslateTest_q <= not (xMSB_uid51_vecTranslateTest_b);

    -- xip1E_3NA_uid58_vecTranslateTest(BITJOIN,57)@0
    xip1E_3NA_uid58_vecTranslateTest_q <= xip1_2_uid48_vecTranslateTest_b & xip1E_3CostZeroPaddingA_uid57_vecTranslateTest_q;

    -- xip1E_3sumAHighB_uid59_vecTranslateTest(ADDSUB,58)@0
    xip1E_3sumAHighB_uid59_vecTranslateTest_s <= invSignOfSelectionSignal_uid56_vecTranslateTest_q;
    xip1E_3sumAHighB_uid59_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_3NA_uid58_vecTranslateTest_q));
    xip1E_3sumAHighB_uid59_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 15 => yip1_2_uid49_vecTranslateTest_b(14)) & yip1_2_uid49_vecTranslateTest_b));
    xip1E_3sumAHighB_uid59_vecTranslateTest_combproc: PROCESS (xip1E_3sumAHighB_uid59_vecTranslateTest_a, xip1E_3sumAHighB_uid59_vecTranslateTest_b, xip1E_3sumAHighB_uid59_vecTranslateTest_s)
    BEGIN
        IF (xip1E_3sumAHighB_uid59_vecTranslateTest_s = "1") THEN
            xip1E_3sumAHighB_uid59_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid59_vecTranslateTest_a) + SIGNED(xip1E_3sumAHighB_uid59_vecTranslateTest_b));
        ELSE
            xip1E_3sumAHighB_uid59_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid59_vecTranslateTest_a) - SIGNED(xip1E_3sumAHighB_uid59_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_3sumAHighB_uid59_vecTranslateTest_q <= xip1E_3sumAHighB_uid59_vecTranslateTest_o(18 downto 0);

    -- xip1_3_uid67_vecTranslateTest(BITSELECT,66)@0
    xip1_3_uid67_vecTranslateTest_in <= xip1E_3sumAHighB_uid59_vecTranslateTest_q(16 downto 0);
    xip1_3_uid67_vecTranslateTest_b <= xip1_3_uid67_vecTranslateTest_in(16 downto 0);

    -- xip1E_4CostZeroPaddingA_uid76_vecTranslateTest(CONSTANT,75)
    xip1E_4CostZeroPaddingA_uid76_vecTranslateTest_q <= "000";

    -- yip1E_4NA_uid80_vecTranslateTest(BITJOIN,79)@0
    yip1E_4NA_uid80_vecTranslateTest_q <= yip1_3_uid68_vecTranslateTest_b & xip1E_4CostZeroPaddingA_uid76_vecTranslateTest_q;

    -- yip1E_4sumAHighB_uid81_vecTranslateTest(ADDSUB,80)@0
    yip1E_4sumAHighB_uid81_vecTranslateTest_s <= xMSB_uid70_vecTranslateTest_b;
    yip1E_4sumAHighB_uid81_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => yip1E_4NA_uid80_vecTranslateTest_q(18)) & yip1E_4NA_uid80_vecTranslateTest_q));
    yip1E_4sumAHighB_uid81_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & xip1_3_uid67_vecTranslateTest_b));
    yip1E_4sumAHighB_uid81_vecTranslateTest_combproc: PROCESS (yip1E_4sumAHighB_uid81_vecTranslateTest_a, yip1E_4sumAHighB_uid81_vecTranslateTest_b, yip1E_4sumAHighB_uid81_vecTranslateTest_s)
    BEGIN
        IF (yip1E_4sumAHighB_uid81_vecTranslateTest_s = "1") THEN
            yip1E_4sumAHighB_uid81_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid81_vecTranslateTest_a) + SIGNED(yip1E_4sumAHighB_uid81_vecTranslateTest_b));
        ELSE
            yip1E_4sumAHighB_uid81_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid81_vecTranslateTest_a) - SIGNED(yip1E_4sumAHighB_uid81_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_4sumAHighB_uid81_vecTranslateTest_q <= yip1E_4sumAHighB_uid81_vecTranslateTest_o(19 downto 0);

    -- yip1_4_uid87_vecTranslateTest(BITSELECT,86)@0
    yip1_4_uid87_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_4sumAHighB_uid81_vecTranslateTest_q(17 downto 0));
    yip1_4_uid87_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_4_uid87_vecTranslateTest_in(17 downto 0));

    -- redist14_yip1_4_uid87_vecTranslateTest_b_1(DELAY,325)
    redist14_yip1_4_uid87_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_4_uid87_vecTranslateTest_b, xout => redist14_yip1_4_uid87_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid89_vecTranslateTest(BITSELECT,88)@1
    xMSB_uid89_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist14_yip1_4_uid87_vecTranslateTest_b_1_q(17 downto 17));

    -- invSignOfSelectionSignal_uid75_vecTranslateTest(LOGICAL,74)@0
    invSignOfSelectionSignal_uid75_vecTranslateTest_q <= not (xMSB_uid70_vecTranslateTest_b);

    -- xip1E_4NA_uid77_vecTranslateTest(BITJOIN,76)@0
    xip1E_4NA_uid77_vecTranslateTest_q <= xip1_3_uid67_vecTranslateTest_b & xip1E_4CostZeroPaddingA_uid76_vecTranslateTest_q;

    -- xip1E_4sumAHighB_uid78_vecTranslateTest(ADDSUB,77)@0
    xip1E_4sumAHighB_uid78_vecTranslateTest_s <= invSignOfSelectionSignal_uid75_vecTranslateTest_q;
    xip1E_4sumAHighB_uid78_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_4NA_uid77_vecTranslateTest_q));
    xip1E_4sumAHighB_uid78_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => yip1_3_uid68_vecTranslateTest_b(15)) & yip1_3_uid68_vecTranslateTest_b));
    xip1E_4sumAHighB_uid78_vecTranslateTest_combproc: PROCESS (xip1E_4sumAHighB_uid78_vecTranslateTest_a, xip1E_4sumAHighB_uid78_vecTranslateTest_b, xip1E_4sumAHighB_uid78_vecTranslateTest_s)
    BEGIN
        IF (xip1E_4sumAHighB_uid78_vecTranslateTest_s = "1") THEN
            xip1E_4sumAHighB_uid78_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid78_vecTranslateTest_a) + SIGNED(xip1E_4sumAHighB_uid78_vecTranslateTest_b));
        ELSE
            xip1E_4sumAHighB_uid78_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid78_vecTranslateTest_a) - SIGNED(xip1E_4sumAHighB_uid78_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_4sumAHighB_uid78_vecTranslateTest_q <= xip1E_4sumAHighB_uid78_vecTranslateTest_o(21 downto 0);

    -- xip1_4_uid86_vecTranslateTest(BITSELECT,85)@0
    xip1_4_uid86_vecTranslateTest_in <= xip1E_4sumAHighB_uid78_vecTranslateTest_q(19 downto 0);
    xip1_4_uid86_vecTranslateTest_b <= xip1_4_uid86_vecTranslateTest_in(19 downto 0);

    -- redist15_xip1_4_uid86_vecTranslateTest_b_1(DELAY,326)
    redist15_xip1_4_uid86_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_4_uid86_vecTranslateTest_b, xout => redist15_xip1_4_uid86_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_5CostZeroPaddingA_uid95_vecTranslateTest(CONSTANT,94)
    xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q <= "0000";

    -- yip1E_5NA_uid99_vecTranslateTest(BITJOIN,98)@1
    yip1E_5NA_uid99_vecTranslateTest_q <= redist14_yip1_4_uid87_vecTranslateTest_b_1_q & xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q;

    -- yip1E_5sumAHighB_uid100_vecTranslateTest(ADDSUB,99)@1
    yip1E_5sumAHighB_uid100_vecTranslateTest_s <= xMSB_uid89_vecTranslateTest_b;
    yip1E_5sumAHighB_uid100_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => yip1E_5NA_uid99_vecTranslateTest_q(21)) & yip1E_5NA_uid99_vecTranslateTest_q));
    yip1E_5sumAHighB_uid100_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist15_xip1_4_uid86_vecTranslateTest_b_1_q));
    yip1E_5sumAHighB_uid100_vecTranslateTest_combproc: PROCESS (yip1E_5sumAHighB_uid100_vecTranslateTest_a, yip1E_5sumAHighB_uid100_vecTranslateTest_b, yip1E_5sumAHighB_uid100_vecTranslateTest_s)
    BEGIN
        IF (yip1E_5sumAHighB_uid100_vecTranslateTest_s = "1") THEN
            yip1E_5sumAHighB_uid100_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid100_vecTranslateTest_a) + SIGNED(yip1E_5sumAHighB_uid100_vecTranslateTest_b));
        ELSE
            yip1E_5sumAHighB_uid100_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid100_vecTranslateTest_a) - SIGNED(yip1E_5sumAHighB_uid100_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_5sumAHighB_uid100_vecTranslateTest_q <= yip1E_5sumAHighB_uid100_vecTranslateTest_o(22 downto 0);

    -- yip1_5_uid106_vecTranslateTest(BITSELECT,105)@1
    yip1_5_uid106_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_5sumAHighB_uid100_vecTranslateTest_q(20 downto 0));
    yip1_5_uid106_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_5_uid106_vecTranslateTest_in(20 downto 0));

    -- xMSB_uid108_vecTranslateTest(BITSELECT,107)@1
    xMSB_uid108_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_5_uid106_vecTranslateTest_b(20 downto 20));

    -- invSignOfSelectionSignal_uid115_vecTranslateTest(LOGICAL,114)@1
    invSignOfSelectionSignal_uid115_vecTranslateTest_q <= not (xMSB_uid108_vecTranslateTest_b);

    -- twoToMiSiYip_uid113_vecTranslateTest(BITSELECT,112)@1
    twoToMiSiYip_uid113_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_5_uid106_vecTranslateTest_b(20 downto 1));

    -- invSignOfSelectionSignal_uid94_vecTranslateTest(LOGICAL,93)@1
    invSignOfSelectionSignal_uid94_vecTranslateTest_q <= not (xMSB_uid89_vecTranslateTest_b);

    -- xip1E_5NA_uid96_vecTranslateTest(BITJOIN,95)@1
    xip1E_5NA_uid96_vecTranslateTest_q <= redist15_xip1_4_uid86_vecTranslateTest_b_1_q & xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q;

    -- xip1E_5sumAHighB_uid97_vecTranslateTest(ADDSUB,96)@1
    xip1E_5sumAHighB_uid97_vecTranslateTest_s <= invSignOfSelectionSignal_uid94_vecTranslateTest_q;
    xip1E_5sumAHighB_uid97_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_5NA_uid96_vecTranslateTest_q));
    xip1E_5sumAHighB_uid97_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 18 => redist14_yip1_4_uid87_vecTranslateTest_b_1_q(17)) & redist14_yip1_4_uid87_vecTranslateTest_b_1_q));
    xip1E_5sumAHighB_uid97_vecTranslateTest_combproc: PROCESS (xip1E_5sumAHighB_uid97_vecTranslateTest_a, xip1E_5sumAHighB_uid97_vecTranslateTest_b, xip1E_5sumAHighB_uid97_vecTranslateTest_s)
    BEGIN
        IF (xip1E_5sumAHighB_uid97_vecTranslateTest_s = "1") THEN
            xip1E_5sumAHighB_uid97_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid97_vecTranslateTest_a) + SIGNED(xip1E_5sumAHighB_uid97_vecTranslateTest_b));
        ELSE
            xip1E_5sumAHighB_uid97_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid97_vecTranslateTest_a) - SIGNED(xip1E_5sumAHighB_uid97_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_5sumAHighB_uid97_vecTranslateTest_q <= xip1E_5sumAHighB_uid97_vecTranslateTest_o(25 downto 0);

    -- xip1_5_uid105_vecTranslateTest(BITSELECT,104)@1
    xip1_5_uid105_vecTranslateTest_in <= xip1E_5sumAHighB_uid97_vecTranslateTest_q(23 downto 0);
    xip1_5_uid105_vecTranslateTest_b <= xip1_5_uid105_vecTranslateTest_in(23 downto 0);

    -- xip1E_6NA_uid117_vecTranslateTest(BITJOIN,116)@1
    xip1E_6NA_uid117_vecTranslateTest_q <= xip1_5_uid105_vecTranslateTest_b & xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q;

    -- xip1E_6sumAHighB_uid118_vecTranslateTest(ADDSUB,117)@1
    xip1E_6sumAHighB_uid118_vecTranslateTest_s <= invSignOfSelectionSignal_uid115_vecTranslateTest_q;
    xip1E_6sumAHighB_uid118_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_6NA_uid117_vecTranslateTest_q));
    xip1E_6sumAHighB_uid118_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 20 => twoToMiSiYip_uid113_vecTranslateTest_b(19)) & twoToMiSiYip_uid113_vecTranslateTest_b));
    xip1E_6sumAHighB_uid118_vecTranslateTest_combproc: PROCESS (xip1E_6sumAHighB_uid118_vecTranslateTest_a, xip1E_6sumAHighB_uid118_vecTranslateTest_b, xip1E_6sumAHighB_uid118_vecTranslateTest_s)
    BEGIN
        IF (xip1E_6sumAHighB_uid118_vecTranslateTest_s = "1") THEN
            xip1E_6sumAHighB_uid118_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid118_vecTranslateTest_a) + SIGNED(xip1E_6sumAHighB_uid118_vecTranslateTest_b));
        ELSE
            xip1E_6sumAHighB_uid118_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid118_vecTranslateTest_a) - SIGNED(xip1E_6sumAHighB_uid118_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_6sumAHighB_uid118_vecTranslateTest_q <= xip1E_6sumAHighB_uid118_vecTranslateTest_o(29 downto 0);

    -- xip1_6_uid126_vecTranslateTest(BITSELECT,125)@1
    xip1_6_uid126_vecTranslateTest_in <= xip1E_6sumAHighB_uid118_vecTranslateTest_q(27 downto 0);
    xip1_6_uid126_vecTranslateTest_b <= xip1_6_uid126_vecTranslateTest_in(27 downto 0);

    -- twoToMiSiXip_uid133_vecTranslateTest(BITSELECT,132)@1
    twoToMiSiXip_uid133_vecTranslateTest_b <= xip1_6_uid126_vecTranslateTest_b(27 downto 6);

    -- twoToMiSiXip_uid112_vecTranslateTest(BITSELECT,111)@1
    twoToMiSiXip_uid112_vecTranslateTest_b <= xip1_5_uid105_vecTranslateTest_b(23 downto 1);

    -- yip1E_6NA_uid120_vecTranslateTest(BITJOIN,119)@1
    yip1E_6NA_uid120_vecTranslateTest_q <= yip1_5_uid106_vecTranslateTest_b & xip1E_5CostZeroPaddingA_uid95_vecTranslateTest_q;

    -- yip1E_6sumAHighB_uid121_vecTranslateTest(ADDSUB,120)@1
    yip1E_6sumAHighB_uid121_vecTranslateTest_s <= xMSB_uid108_vecTranslateTest_b;
    yip1E_6sumAHighB_uid121_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => yip1E_6NA_uid120_vecTranslateTest_q(24)) & yip1E_6NA_uid120_vecTranslateTest_q));
    yip1E_6sumAHighB_uid121_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid112_vecTranslateTest_b));
    yip1E_6sumAHighB_uid121_vecTranslateTest_combproc: PROCESS (yip1E_6sumAHighB_uid121_vecTranslateTest_a, yip1E_6sumAHighB_uid121_vecTranslateTest_b, yip1E_6sumAHighB_uid121_vecTranslateTest_s)
    BEGIN
        IF (yip1E_6sumAHighB_uid121_vecTranslateTest_s = "1") THEN
            yip1E_6sumAHighB_uid121_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid121_vecTranslateTest_a) + SIGNED(yip1E_6sumAHighB_uid121_vecTranslateTest_b));
        ELSE
            yip1E_6sumAHighB_uid121_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid121_vecTranslateTest_a) - SIGNED(yip1E_6sumAHighB_uid121_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_6sumAHighB_uid121_vecTranslateTest_q <= yip1E_6sumAHighB_uid121_vecTranslateTest_o(25 downto 0);

    -- yip1_6_uid127_vecTranslateTest(BITSELECT,126)@1
    yip1_6_uid127_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_6sumAHighB_uid121_vecTranslateTest_q(23 downto 0));
    yip1_6_uid127_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_6_uid127_vecTranslateTest_in(23 downto 0));

    -- yip1E_7_uid138_vecTranslateTest(ADDSUB,137)@1
    yip1E_7_uid138_vecTranslateTest_s <= xMSB_uid129_vecTranslateTest_b;
    yip1E_7_uid138_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => yip1_6_uid127_vecTranslateTest_b(23)) & yip1_6_uid127_vecTranslateTest_b));
    yip1E_7_uid138_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid133_vecTranslateTest_b));
    yip1E_7_uid138_vecTranslateTest_combproc: PROCESS (yip1E_7_uid138_vecTranslateTest_a, yip1E_7_uid138_vecTranslateTest_b, yip1E_7_uid138_vecTranslateTest_s)
    BEGIN
        IF (yip1E_7_uid138_vecTranslateTest_s = "1") THEN
            yip1E_7_uid138_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid138_vecTranslateTest_a) + SIGNED(yip1E_7_uid138_vecTranslateTest_b));
        ELSE
            yip1E_7_uid138_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid138_vecTranslateTest_a) - SIGNED(yip1E_7_uid138_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid138_vecTranslateTest_q <= yip1E_7_uid138_vecTranslateTest_o(24 downto 0);

    -- yip1_7_uid144_vecTranslateTest(BITSELECT,143)@1
    yip1_7_uid144_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid138_vecTranslateTest_q(22 downto 0));
    yip1_7_uid144_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_7_uid144_vecTranslateTest_in(22 downto 0));

    -- xMSB_uid146_vecTranslateTest(BITSELECT,145)@1
    xMSB_uid146_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_7_uid144_vecTranslateTest_b(22 downto 22));

    -- invSignOfSelectionSignal_uid153_vecTranslateTest(LOGICAL,152)@1
    invSignOfSelectionSignal_uid153_vecTranslateTest_q <= not (xMSB_uid146_vecTranslateTest_b);

    -- twoToMiSiYip_uid151_vecTranslateTest(BITSELECT,150)@1
    twoToMiSiYip_uid151_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_7_uid144_vecTranslateTest_b(22 downto 7));

    -- invSignOfSelectionSignal_uid136_vecTranslateTest(LOGICAL,135)@1
    invSignOfSelectionSignal_uid136_vecTranslateTest_q <= not (xMSB_uid129_vecTranslateTest_b);

    -- twoToMiSiYip_uid134_vecTranslateTest(BITSELECT,133)@1
    twoToMiSiYip_uid134_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_6_uid127_vecTranslateTest_b(23 downto 6));

    -- xip1E_7_uid137_vecTranslateTest(ADDSUB,136)@1
    xip1E_7_uid137_vecTranslateTest_s <= invSignOfSelectionSignal_uid136_vecTranslateTest_q;
    xip1E_7_uid137_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1_6_uid126_vecTranslateTest_b));
    xip1E_7_uid137_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 18 => twoToMiSiYip_uid134_vecTranslateTest_b(17)) & twoToMiSiYip_uid134_vecTranslateTest_b));
    xip1E_7_uid137_vecTranslateTest_combproc: PROCESS (xip1E_7_uid137_vecTranslateTest_a, xip1E_7_uid137_vecTranslateTest_b, xip1E_7_uid137_vecTranslateTest_s)
    BEGIN
        IF (xip1E_7_uid137_vecTranslateTest_s = "1") THEN
            xip1E_7_uid137_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid137_vecTranslateTest_a) + SIGNED(xip1E_7_uid137_vecTranslateTest_b));
        ELSE
            xip1E_7_uid137_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid137_vecTranslateTest_a) - SIGNED(xip1E_7_uid137_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid137_vecTranslateTest_q <= xip1E_7_uid137_vecTranslateTest_o(29 downto 0);

    -- xip1_7_uid143_vecTranslateTest(BITSELECT,142)@1
    xip1_7_uid143_vecTranslateTest_in <= xip1E_7_uid137_vecTranslateTest_q(27 downto 0);
    xip1_7_uid143_vecTranslateTest_b <= xip1_7_uid143_vecTranslateTest_in(27 downto 0);

    -- xip1E_8_uid154_vecTranslateTest(ADDSUB,153)@1
    xip1E_8_uid154_vecTranslateTest_s <= invSignOfSelectionSignal_uid153_vecTranslateTest_q;
    xip1E_8_uid154_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1_7_uid143_vecTranslateTest_b));
    xip1E_8_uid154_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 16 => twoToMiSiYip_uid151_vecTranslateTest_b(15)) & twoToMiSiYip_uid151_vecTranslateTest_b));
    xip1E_8_uid154_vecTranslateTest_combproc: PROCESS (xip1E_8_uid154_vecTranslateTest_a, xip1E_8_uid154_vecTranslateTest_b, xip1E_8_uid154_vecTranslateTest_s)
    BEGIN
        IF (xip1E_8_uid154_vecTranslateTest_s = "1") THEN
            xip1E_8_uid154_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid154_vecTranslateTest_a) + SIGNED(xip1E_8_uid154_vecTranslateTest_b));
        ELSE
            xip1E_8_uid154_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid154_vecTranslateTest_a) - SIGNED(xip1E_8_uid154_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid154_vecTranslateTest_q <= xip1E_8_uid154_vecTranslateTest_o(29 downto 0);

    -- xip1_8_uid160_vecTranslateTest(BITSELECT,159)@1
    xip1_8_uid160_vecTranslateTest_in <= xip1E_8_uid154_vecTranslateTest_q(27 downto 0);
    xip1_8_uid160_vecTranslateTest_b <= xip1_8_uid160_vecTranslateTest_in(27 downto 0);

    -- twoToMiSiXip_uid167_vecTranslateTest(BITSELECT,166)@1
    twoToMiSiXip_uid167_vecTranslateTest_b <= xip1_8_uid160_vecTranslateTest_b(27 downto 8);

    -- twoToMiSiXip_uid150_vecTranslateTest(BITSELECT,149)@1
    twoToMiSiXip_uid150_vecTranslateTest_b <= xip1_7_uid143_vecTranslateTest_b(27 downto 7);

    -- yip1E_8_uid155_vecTranslateTest(ADDSUB,154)@1
    yip1E_8_uid155_vecTranslateTest_s <= xMSB_uid146_vecTranslateTest_b;
    yip1E_8_uid155_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_7_uid144_vecTranslateTest_b(22)) & yip1_7_uid144_vecTranslateTest_b));
    yip1E_8_uid155_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid150_vecTranslateTest_b));
    yip1E_8_uid155_vecTranslateTest_combproc: PROCESS (yip1E_8_uid155_vecTranslateTest_a, yip1E_8_uid155_vecTranslateTest_b, yip1E_8_uid155_vecTranslateTest_s)
    BEGIN
        IF (yip1E_8_uid155_vecTranslateTest_s = "1") THEN
            yip1E_8_uid155_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid155_vecTranslateTest_a) + SIGNED(yip1E_8_uid155_vecTranslateTest_b));
        ELSE
            yip1E_8_uid155_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid155_vecTranslateTest_a) - SIGNED(yip1E_8_uid155_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid155_vecTranslateTest_q <= yip1E_8_uid155_vecTranslateTest_o(23 downto 0);

    -- yip1_8_uid161_vecTranslateTest(BITSELECT,160)@1
    yip1_8_uid161_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid155_vecTranslateTest_q(21 downto 0));
    yip1_8_uid161_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_8_uid161_vecTranslateTest_in(21 downto 0));

    -- yip1E_9_uid172_vecTranslateTest(ADDSUB,171)@1
    yip1E_9_uid172_vecTranslateTest_s <= xMSB_uid163_vecTranslateTest_b;
    yip1E_9_uid172_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => yip1_8_uid161_vecTranslateTest_b(21)) & yip1_8_uid161_vecTranslateTest_b));
    yip1E_9_uid172_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid167_vecTranslateTest_b));
    yip1E_9_uid172_vecTranslateTest_combproc: PROCESS (yip1E_9_uid172_vecTranslateTest_a, yip1E_9_uid172_vecTranslateTest_b, yip1E_9_uid172_vecTranslateTest_s)
    BEGIN
        IF (yip1E_9_uid172_vecTranslateTest_s = "1") THEN
            yip1E_9_uid172_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid172_vecTranslateTest_a) + SIGNED(yip1E_9_uid172_vecTranslateTest_b));
        ELSE
            yip1E_9_uid172_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid172_vecTranslateTest_a) - SIGNED(yip1E_9_uid172_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid172_vecTranslateTest_q <= yip1E_9_uid172_vecTranslateTest_o(22 downto 0);

    -- yip1_9_uid178_vecTranslateTest(BITSELECT,177)@1
    yip1_9_uid178_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid172_vecTranslateTest_q(20 downto 0));
    yip1_9_uid178_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_9_uid178_vecTranslateTest_in(20 downto 0));

    -- redist7_yip1_9_uid178_vecTranslateTest_b_1(DELAY,318)
    redist7_yip1_9_uid178_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 21, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_9_uid178_vecTranslateTest_b, xout => redist7_yip1_9_uid178_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid180_vecTranslateTest(BITSELECT,179)@2
    xMSB_uid180_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist7_yip1_9_uid178_vecTranslateTest_b_1_q(20 downto 20));

    -- invSignOfSelectionSignal_uid187_vecTranslateTest(LOGICAL,186)@2
    invSignOfSelectionSignal_uid187_vecTranslateTest_q <= not (xMSB_uid180_vecTranslateTest_b);

    -- twoToMiSiYip_uid185_vecTranslateTest(BITSELECT,184)@2
    twoToMiSiYip_uid185_vecTranslateTest_b <= STD_LOGIC_VECTOR(redist7_yip1_9_uid178_vecTranslateTest_b_1_q(20 downto 9));

    -- invSignOfSelectionSignal_uid170_vecTranslateTest(LOGICAL,169)@1
    invSignOfSelectionSignal_uid170_vecTranslateTest_q <= not (xMSB_uid163_vecTranslateTest_b);

    -- twoToMiSiYip_uid168_vecTranslateTest(BITSELECT,167)@1
    twoToMiSiYip_uid168_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_8_uid161_vecTranslateTest_b(21 downto 8));

    -- xip1E_9_uid171_vecTranslateTest(ADDSUB,170)@1
    xip1E_9_uid171_vecTranslateTest_s <= invSignOfSelectionSignal_uid170_vecTranslateTest_q;
    xip1E_9_uid171_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1_8_uid160_vecTranslateTest_b));
    xip1E_9_uid171_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 14 => twoToMiSiYip_uid168_vecTranslateTest_b(13)) & twoToMiSiYip_uid168_vecTranslateTest_b));
    xip1E_9_uid171_vecTranslateTest_combproc: PROCESS (xip1E_9_uid171_vecTranslateTest_a, xip1E_9_uid171_vecTranslateTest_b, xip1E_9_uid171_vecTranslateTest_s)
    BEGIN
        IF (xip1E_9_uid171_vecTranslateTest_s = "1") THEN
            xip1E_9_uid171_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid171_vecTranslateTest_a) + SIGNED(xip1E_9_uid171_vecTranslateTest_b));
        ELSE
            xip1E_9_uid171_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid171_vecTranslateTest_a) - SIGNED(xip1E_9_uid171_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid171_vecTranslateTest_q <= xip1E_9_uid171_vecTranslateTest_o(29 downto 0);

    -- xip1_9_uid177_vecTranslateTest(BITSELECT,176)@1
    xip1_9_uid177_vecTranslateTest_in <= xip1E_9_uid171_vecTranslateTest_q(27 downto 0);
    xip1_9_uid177_vecTranslateTest_b <= xip1_9_uid177_vecTranslateTest_in(27 downto 0);

    -- redist8_xip1_9_uid177_vecTranslateTest_b_1(DELAY,319)
    redist8_xip1_9_uid177_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_9_uid177_vecTranslateTest_b, xout => redist8_xip1_9_uid177_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_10_uid188_vecTranslateTest(ADDSUB,187)@2
    xip1E_10_uid188_vecTranslateTest_s <= invSignOfSelectionSignal_uid187_vecTranslateTest_q;
    xip1E_10_uid188_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist8_xip1_9_uid177_vecTranslateTest_b_1_q));
    xip1E_10_uid188_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 12 => twoToMiSiYip_uid185_vecTranslateTest_b(11)) & twoToMiSiYip_uid185_vecTranslateTest_b));
    xip1E_10_uid188_vecTranslateTest_combproc: PROCESS (xip1E_10_uid188_vecTranslateTest_a, xip1E_10_uid188_vecTranslateTest_b, xip1E_10_uid188_vecTranslateTest_s)
    BEGIN
        IF (xip1E_10_uid188_vecTranslateTest_s = "1") THEN
            xip1E_10_uid188_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid188_vecTranslateTest_a) + SIGNED(xip1E_10_uid188_vecTranslateTest_b));
        ELSE
            xip1E_10_uid188_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid188_vecTranslateTest_a) - SIGNED(xip1E_10_uid188_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid188_vecTranslateTest_q <= xip1E_10_uid188_vecTranslateTest_o(29 downto 0);

    -- xip1_10_uid194_vecTranslateTest(BITSELECT,193)@2
    xip1_10_uid194_vecTranslateTest_in <= xip1E_10_uid188_vecTranslateTest_q(27 downto 0);
    xip1_10_uid194_vecTranslateTest_b <= xip1_10_uid194_vecTranslateTest_in(27 downto 0);

    -- twoToMiSiXip_uid201_vecTranslateTest(BITSELECT,200)@2
    twoToMiSiXip_uid201_vecTranslateTest_b <= xip1_10_uid194_vecTranslateTest_b(27 downto 10);

    -- twoToMiSiXip_uid184_vecTranslateTest(BITSELECT,183)@2
    twoToMiSiXip_uid184_vecTranslateTest_b <= redist8_xip1_9_uid177_vecTranslateTest_b_1_q(27 downto 9);

    -- yip1E_10_uid189_vecTranslateTest(ADDSUB,188)@2
    yip1E_10_uid189_vecTranslateTest_s <= xMSB_uid180_vecTranslateTest_b;
    yip1E_10_uid189_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => redist7_yip1_9_uid178_vecTranslateTest_b_1_q(20)) & redist7_yip1_9_uid178_vecTranslateTest_b_1_q));
    yip1E_10_uid189_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid184_vecTranslateTest_b));
    yip1E_10_uid189_vecTranslateTest_combproc: PROCESS (yip1E_10_uid189_vecTranslateTest_a, yip1E_10_uid189_vecTranslateTest_b, yip1E_10_uid189_vecTranslateTest_s)
    BEGIN
        IF (yip1E_10_uid189_vecTranslateTest_s = "1") THEN
            yip1E_10_uid189_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid189_vecTranslateTest_a) + SIGNED(yip1E_10_uid189_vecTranslateTest_b));
        ELSE
            yip1E_10_uid189_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid189_vecTranslateTest_a) - SIGNED(yip1E_10_uid189_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid189_vecTranslateTest_q <= yip1E_10_uid189_vecTranslateTest_o(21 downto 0);

    -- yip1_10_uid195_vecTranslateTest(BITSELECT,194)@2
    yip1_10_uid195_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid189_vecTranslateTest_q(19 downto 0));
    yip1_10_uid195_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_10_uid195_vecTranslateTest_in(19 downto 0));

    -- yip1E_11_uid206_vecTranslateTest(ADDSUB,205)@2
    yip1E_11_uid206_vecTranslateTest_s <= xMSB_uid197_vecTranslateTest_b;
    yip1E_11_uid206_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => yip1_10_uid195_vecTranslateTest_b(19)) & yip1_10_uid195_vecTranslateTest_b));
    yip1E_11_uid206_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid201_vecTranslateTest_b));
    yip1E_11_uid206_vecTranslateTest_combproc: PROCESS (yip1E_11_uid206_vecTranslateTest_a, yip1E_11_uid206_vecTranslateTest_b, yip1E_11_uid206_vecTranslateTest_s)
    BEGIN
        IF (yip1E_11_uid206_vecTranslateTest_s = "1") THEN
            yip1E_11_uid206_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid206_vecTranslateTest_a) + SIGNED(yip1E_11_uid206_vecTranslateTest_b));
        ELSE
            yip1E_11_uid206_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid206_vecTranslateTest_a) - SIGNED(yip1E_11_uid206_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_11_uid206_vecTranslateTest_q <= yip1E_11_uid206_vecTranslateTest_o(20 downto 0);

    -- yip1_11_uid212_vecTranslateTest(BITSELECT,211)@2
    yip1_11_uid212_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_11_uid206_vecTranslateTest_q(18 downto 0));
    yip1_11_uid212_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_11_uid212_vecTranslateTest_in(18 downto 0));

    -- xMSB_uid214_vecTranslateTest(BITSELECT,213)@2
    xMSB_uid214_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_11_uid212_vecTranslateTest_b(18 downto 18));

    -- invSignOfSelectionSignal_uid221_vecTranslateTest(LOGICAL,220)@2
    invSignOfSelectionSignal_uid221_vecTranslateTest_q <= not (xMSB_uid214_vecTranslateTest_b);

    -- twoToMiSiYip_uid219_vecTranslateTest(BITSELECT,218)@2
    twoToMiSiYip_uid219_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_11_uid212_vecTranslateTest_b(18 downto 11));

    -- invSignOfSelectionSignal_uid204_vecTranslateTest(LOGICAL,203)@2
    invSignOfSelectionSignal_uid204_vecTranslateTest_q <= not (xMSB_uid197_vecTranslateTest_b);

    -- twoToMiSiYip_uid202_vecTranslateTest(BITSELECT,201)@2
    twoToMiSiYip_uid202_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_10_uid195_vecTranslateTest_b(19 downto 10));

    -- xip1E_11_uid205_vecTranslateTest(ADDSUB,204)@2
    xip1E_11_uid205_vecTranslateTest_s <= invSignOfSelectionSignal_uid204_vecTranslateTest_q;
    xip1E_11_uid205_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1_10_uid194_vecTranslateTest_b));
    xip1E_11_uid205_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 10 => twoToMiSiYip_uid202_vecTranslateTest_b(9)) & twoToMiSiYip_uid202_vecTranslateTest_b));
    xip1E_11_uid205_vecTranslateTest_combproc: PROCESS (xip1E_11_uid205_vecTranslateTest_a, xip1E_11_uid205_vecTranslateTest_b, xip1E_11_uid205_vecTranslateTest_s)
    BEGIN
        IF (xip1E_11_uid205_vecTranslateTest_s = "1") THEN
            xip1E_11_uid205_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid205_vecTranslateTest_a) + SIGNED(xip1E_11_uid205_vecTranslateTest_b));
        ELSE
            xip1E_11_uid205_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid205_vecTranslateTest_a) - SIGNED(xip1E_11_uid205_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_11_uid205_vecTranslateTest_q <= xip1E_11_uid205_vecTranslateTest_o(29 downto 0);

    -- xip1_11_uid211_vecTranslateTest(BITSELECT,210)@2
    xip1_11_uid211_vecTranslateTest_in <= xip1E_11_uid205_vecTranslateTest_q(27 downto 0);
    xip1_11_uid211_vecTranslateTest_b <= xip1_11_uid211_vecTranslateTest_in(27 downto 0);

    -- xip1E_12_uid222_vecTranslateTest(ADDSUB,221)@2
    xip1E_12_uid222_vecTranslateTest_s <= invSignOfSelectionSignal_uid221_vecTranslateTest_q;
    xip1E_12_uid222_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1_11_uid211_vecTranslateTest_b));
    xip1E_12_uid222_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 8 => twoToMiSiYip_uid219_vecTranslateTest_b(7)) & twoToMiSiYip_uid219_vecTranslateTest_b));
    xip1E_12_uid222_vecTranslateTest_combproc: PROCESS (xip1E_12_uid222_vecTranslateTest_a, xip1E_12_uid222_vecTranslateTest_b, xip1E_12_uid222_vecTranslateTest_s)
    BEGIN
        IF (xip1E_12_uid222_vecTranslateTest_s = "1") THEN
            xip1E_12_uid222_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid222_vecTranslateTest_a) + SIGNED(xip1E_12_uid222_vecTranslateTest_b));
        ELSE
            xip1E_12_uid222_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid222_vecTranslateTest_a) - SIGNED(xip1E_12_uid222_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_12_uid222_vecTranslateTest_q <= xip1E_12_uid222_vecTranslateTest_o(29 downto 0);

    -- xip1_12_uid228_vecTranslateTest(BITSELECT,227)@2
    xip1_12_uid228_vecTranslateTest_in <= xip1E_12_uid222_vecTranslateTest_q(27 downto 0);
    xip1_12_uid228_vecTranslateTest_b <= xip1_12_uid228_vecTranslateTest_in(27 downto 0);

    -- twoToMiSiXip_uid235_vecTranslateTest(BITSELECT,234)@2
    twoToMiSiXip_uid235_vecTranslateTest_b <= xip1_12_uid228_vecTranslateTest_b(27 downto 12);

    -- twoToMiSiXip_uid218_vecTranslateTest(BITSELECT,217)@2
    twoToMiSiXip_uid218_vecTranslateTest_b <= xip1_11_uid211_vecTranslateTest_b(27 downto 11);

    -- yip1E_12_uid223_vecTranslateTest(ADDSUB,222)@2
    yip1E_12_uid223_vecTranslateTest_s <= xMSB_uid214_vecTranslateTest_b;
    yip1E_12_uid223_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => yip1_11_uid212_vecTranslateTest_b(18)) & yip1_11_uid212_vecTranslateTest_b));
    yip1E_12_uid223_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid218_vecTranslateTest_b));
    yip1E_12_uid223_vecTranslateTest_combproc: PROCESS (yip1E_12_uid223_vecTranslateTest_a, yip1E_12_uid223_vecTranslateTest_b, yip1E_12_uid223_vecTranslateTest_s)
    BEGIN
        IF (yip1E_12_uid223_vecTranslateTest_s = "1") THEN
            yip1E_12_uid223_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid223_vecTranslateTest_a) + SIGNED(yip1E_12_uid223_vecTranslateTest_b));
        ELSE
            yip1E_12_uid223_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid223_vecTranslateTest_a) - SIGNED(yip1E_12_uid223_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_12_uid223_vecTranslateTest_q <= yip1E_12_uid223_vecTranslateTest_o(19 downto 0);

    -- yip1_12_uid229_vecTranslateTest(BITSELECT,228)@2
    yip1_12_uid229_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_12_uid223_vecTranslateTest_q(17 downto 0));
    yip1_12_uid229_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_12_uid229_vecTranslateTest_in(17 downto 0));

    -- yip1E_13_uid240_vecTranslateTest(ADDSUB,239)@2
    yip1E_13_uid240_vecTranslateTest_s <= xMSB_uid231_vecTranslateTest_b;
    yip1E_13_uid240_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => yip1_12_uid229_vecTranslateTest_b(17)) & yip1_12_uid229_vecTranslateTest_b));
    yip1E_13_uid240_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid235_vecTranslateTest_b));
    yip1E_13_uid240_vecTranslateTest_combproc: PROCESS (yip1E_13_uid240_vecTranslateTest_a, yip1E_13_uid240_vecTranslateTest_b, yip1E_13_uid240_vecTranslateTest_s)
    BEGIN
        IF (yip1E_13_uid240_vecTranslateTest_s = "1") THEN
            yip1E_13_uid240_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid240_vecTranslateTest_a) + SIGNED(yip1E_13_uid240_vecTranslateTest_b));
        ELSE
            yip1E_13_uid240_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid240_vecTranslateTest_a) - SIGNED(yip1E_13_uid240_vecTranslateTest_b));
        END IF;
    END PROCESS;
    yip1E_13_uid240_vecTranslateTest_q <= yip1E_13_uid240_vecTranslateTest_o(18 downto 0);

    -- yip1_13_uid246_vecTranslateTest(BITSELECT,245)@2
    yip1_13_uid246_vecTranslateTest_in <= STD_LOGIC_VECTOR(yip1E_13_uid240_vecTranslateTest_q(16 downto 0));
    yip1_13_uid246_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_13_uid246_vecTranslateTest_in(16 downto 0));

    -- xMSB_uid248_vecTranslateTest(BITSELECT,247)@2
    xMSB_uid248_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_13_uid246_vecTranslateTest_b(16 downto 16));

    -- redist1_xMSB_uid248_vecTranslateTest_b_1(DELAY,312)
    redist1_xMSB_uid248_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid248_vecTranslateTest_b, xout => redist1_xMSB_uid248_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- invSignOfSelectionSignal_uid255_vecTranslateTest(LOGICAL,254)@3
    invSignOfSelectionSignal_uid255_vecTranslateTest_q <= not (redist1_xMSB_uid248_vecTranslateTest_b_1_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- twoToMiSiYip_uid253_vecTranslateTest(BITSELECT,252)@2
    twoToMiSiYip_uid253_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_13_uid246_vecTranslateTest_b(16 downto 13));

    -- redist0_twoToMiSiYip_uid253_vecTranslateTest_b_1(DELAY,311)
    redist0_twoToMiSiYip_uid253_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => twoToMiSiYip_uid253_vecTranslateTest_b, xout => redist0_twoToMiSiYip_uid253_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- invSignOfSelectionSignal_uid238_vecTranslateTest(LOGICAL,237)@2
    invSignOfSelectionSignal_uid238_vecTranslateTest_q <= not (xMSB_uid231_vecTranslateTest_b);

    -- twoToMiSiYip_uid236_vecTranslateTest(BITSELECT,235)@2
    twoToMiSiYip_uid236_vecTranslateTest_b <= STD_LOGIC_VECTOR(yip1_12_uid229_vecTranslateTest_b(17 downto 12));

    -- xip1E_13_uid239_vecTranslateTest(ADDSUB,238)@2
    xip1E_13_uid239_vecTranslateTest_s <= invSignOfSelectionSignal_uid238_vecTranslateTest_q;
    xip1E_13_uid239_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1_12_uid228_vecTranslateTest_b));
    xip1E_13_uid239_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 6 => twoToMiSiYip_uid236_vecTranslateTest_b(5)) & twoToMiSiYip_uid236_vecTranslateTest_b));
    xip1E_13_uid239_vecTranslateTest_combproc: PROCESS (xip1E_13_uid239_vecTranslateTest_a, xip1E_13_uid239_vecTranslateTest_b, xip1E_13_uid239_vecTranslateTest_s)
    BEGIN
        IF (xip1E_13_uid239_vecTranslateTest_s = "1") THEN
            xip1E_13_uid239_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid239_vecTranslateTest_a) + SIGNED(xip1E_13_uid239_vecTranslateTest_b));
        ELSE
            xip1E_13_uid239_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid239_vecTranslateTest_a) - SIGNED(xip1E_13_uid239_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_13_uid239_vecTranslateTest_q <= xip1E_13_uid239_vecTranslateTest_o(29 downto 0);

    -- xip1_13_uid245_vecTranslateTest(BITSELECT,244)@2
    xip1_13_uid245_vecTranslateTest_in <= xip1E_13_uid239_vecTranslateTest_q(27 downto 0);
    xip1_13_uid245_vecTranslateTest_b <= xip1_13_uid245_vecTranslateTest_in(27 downto 0);

    -- redist2_xip1_13_uid245_vecTranslateTest_b_1(DELAY,313)
    redist2_xip1_13_uid245_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_13_uid245_vecTranslateTest_b, xout => redist2_xip1_13_uid245_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_14_uid256_vecTranslateTest(ADDSUB,255)@3
    xip1E_14_uid256_vecTranslateTest_s <= invSignOfSelectionSignal_uid255_vecTranslateTest_q;
    xip1E_14_uid256_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist2_xip1_13_uid245_vecTranslateTest_b_1_q));
    xip1E_14_uid256_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 4 => redist0_twoToMiSiYip_uid253_vecTranslateTest_b_1_q(3)) & redist0_twoToMiSiYip_uid253_vecTranslateTest_b_1_q));
    xip1E_14_uid256_vecTranslateTest_combproc: PROCESS (xip1E_14_uid256_vecTranslateTest_a, xip1E_14_uid256_vecTranslateTest_b, xip1E_14_uid256_vecTranslateTest_s)
    BEGIN
        IF (xip1E_14_uid256_vecTranslateTest_s = "1") THEN
            xip1E_14_uid256_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid256_vecTranslateTest_a) + SIGNED(xip1E_14_uid256_vecTranslateTest_b));
        ELSE
            xip1E_14_uid256_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid256_vecTranslateTest_a) - SIGNED(xip1E_14_uid256_vecTranslateTest_b));
        END IF;
    END PROCESS;
    xip1E_14_uid256_vecTranslateTest_q <= xip1E_14_uid256_vecTranslateTest_o(29 downto 0);

    -- xip1_14_uid262_vecTranslateTest(BITSELECT,261)@3
    xip1_14_uid262_vecTranslateTest_in <= xip1E_14_uid256_vecTranslateTest_q(27 downto 0);
    xip1_14_uid262_vecTranslateTest_b <= xip1_14_uid262_vecTranslateTest_in(27 downto 0);

    -- outMagPreRnd_uid305_vecTranslateTest(BITSELECT,304)@3
    outMagPreRnd_uid305_vecTranslateTest_b <= xip1_14_uid262_vecTranslateTest_b(27 downto 13);

    -- outMagPostRnd_uid308_vecTranslateTest(ADD,307)@3
    outMagPostRnd_uid308_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & outMagPreRnd_uid305_vecTranslateTest_b);
    outMagPostRnd_uid308_vecTranslateTest_b <= STD_LOGIC_VECTOR("000000000000000" & VCC_q);
    outMagPostRnd_uid308_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(outMagPostRnd_uid308_vecTranslateTest_a) + UNSIGNED(outMagPostRnd_uid308_vecTranslateTest_b));
    outMagPostRnd_uid308_vecTranslateTest_q <= outMagPostRnd_uid308_vecTranslateTest_o(15 downto 0);

    -- outMag_uid309_vecTranslateTest(BITSELECT,308)@3
    outMag_uid309_vecTranslateTest_in <= outMagPostRnd_uid308_vecTranslateTest_q(14 downto 0);
    outMag_uid309_vecTranslateTest_b <= outMag_uid309_vecTranslateTest_in(14 downto 1);

    -- constPi_uid296_vecTranslateTest(CONSTANT,295)
    constPi_uid296_vecTranslateTest_q <= "110010010001000";

    -- constPiP2uE_uid287_vecTranslateTest(CONSTANT,286)
    constPiP2uE_uid287_vecTranslateTest_q <= "11001001000110";

    -- constPio2P2u_mergedSignalTM_uid290_vecTranslateTest(BITJOIN,289)@3
    constPio2P2u_mergedSignalTM_uid290_vecTranslateTest_q <= GND_q & constPiP2uE_uid287_vecTranslateTest_q;

    -- cstZeroOutFormat_uid286_vecTranslateTest(CONSTANT,285)
    cstZeroOutFormat_uid286_vecTranslateTest_q <= "000000000000010";

    -- redist18_xMSB_uid32_vecTranslateTest_b_3(DELAY,329)
    redist18_xMSB_uid32_vecTranslateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid32_vecTranslateTest_b, xout => redist18_xMSB_uid32_vecTranslateTest_b_3_q, ena => en(0), clk => clk, aclr => areset );

    -- redist17_xMSB_uid51_vecTranslateTest_b_3(DELAY,328)
    redist17_xMSB_uid51_vecTranslateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid51_vecTranslateTest_b, xout => redist17_xMSB_uid51_vecTranslateTest_b_3_q, ena => en(0), clk => clk, aclr => areset );

    -- redist16_xMSB_uid70_vecTranslateTest_b_3(DELAY,327)
    redist16_xMSB_uid70_vecTranslateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid70_vecTranslateTest_b, xout => redist16_xMSB_uid70_vecTranslateTest_b_3_q, ena => en(0), clk => clk, aclr => areset );

    -- redist13_xMSB_uid89_vecTranslateTest_b_2(DELAY,324)
    redist13_xMSB_uid89_vecTranslateTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid89_vecTranslateTest_b, xout => redist13_xMSB_uid89_vecTranslateTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- redist12_xMSB_uid108_vecTranslateTest_b_2(DELAY,323)
    redist12_xMSB_uid108_vecTranslateTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid108_vecTranslateTest_b, xout => redist12_xMSB_uid108_vecTranslateTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- redist11_xMSB_uid129_vecTranslateTest_b_2(DELAY,322)
    redist11_xMSB_uid129_vecTranslateTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid129_vecTranslateTest_b, xout => redist11_xMSB_uid129_vecTranslateTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- redist10_xMSB_uid146_vecTranslateTest_b_2(DELAY,321)
    redist10_xMSB_uid146_vecTranslateTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid146_vecTranslateTest_b, xout => redist10_xMSB_uid146_vecTranslateTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- redist9_xMSB_uid163_vecTranslateTest_b_2(DELAY,320)
    redist9_xMSB_uid163_vecTranslateTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid163_vecTranslateTest_b, xout => redist9_xMSB_uid163_vecTranslateTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- redist6_xMSB_uid180_vecTranslateTest_b_1(DELAY,317)
    redist6_xMSB_uid180_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid180_vecTranslateTest_b, xout => redist6_xMSB_uid180_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- redist5_xMSB_uid197_vecTranslateTest_b_1(DELAY,316)
    redist5_xMSB_uid197_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid197_vecTranslateTest_b, xout => redist5_xMSB_uid197_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- redist4_xMSB_uid214_vecTranslateTest_b_1(DELAY,315)
    redist4_xMSB_uid214_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid214_vecTranslateTest_b, xout => redist4_xMSB_uid214_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- redist3_xMSB_uid231_vecTranslateTest_b_1(DELAY,314)
    redist3_xMSB_uid231_vecTranslateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid231_vecTranslateTest_b, xout => redist3_xMSB_uid231_vecTranslateTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- concSignVector_uid265_vecTranslateTest(BITJOIN,264)@3
    concSignVector_uid265_vecTranslateTest_q <= GND_q & redist18_xMSB_uid32_vecTranslateTest_b_3_q & redist17_xMSB_uid51_vecTranslateTest_b_3_q & redist16_xMSB_uid70_vecTranslateTest_b_3_q & redist13_xMSB_uid89_vecTranslateTest_b_2_q & redist12_xMSB_uid108_vecTranslateTest_b_2_q & redist11_xMSB_uid129_vecTranslateTest_b_2_q & redist10_xMSB_uid146_vecTranslateTest_b_2_q & redist9_xMSB_uid163_vecTranslateTest_b_2_q & redist6_xMSB_uid180_vecTranslateTest_b_1_q & redist5_xMSB_uid197_vecTranslateTest_b_1_q & redist4_xMSB_uid214_vecTranslateTest_b_1_q & redist3_xMSB_uid231_vecTranslateTest_b_1_q & redist1_xMSB_uid248_vecTranslateTest_b_1_q;

    -- is0_uid266_vecTranslateTest_merged_bit_select(BITSELECT,310)@3
    is0_uid266_vecTranslateTest_merged_bit_select_b <= concSignVector_uid265_vecTranslateTest_q(13 downto 10);
    is0_uid266_vecTranslateTest_merged_bit_select_c <= concSignVector_uid265_vecTranslateTest_q(9 downto 6);
    is0_uid266_vecTranslateTest_merged_bit_select_d <= concSignVector_uid265_vecTranslateTest_q(5 downto 2);
    is0_uid266_vecTranslateTest_merged_bit_select_e <= concSignVector_uid265_vecTranslateTest_q(1 downto 0);

    -- table_l13_uid279_vecTranslateTest(LOOKUP,278)@3
    table_l13_uid279_vecTranslateTest_combproc: PROCESS (is0_uid266_vecTranslateTest_merged_bit_select_e)
    BEGIN
        -- Begin reserved scope level
        CASE (is0_uid266_vecTranslateTest_merged_bit_select_e) IS
            WHEN "00" => table_l13_uid279_vecTranslateTest_q <= "0110000";
            WHEN "01" => table_l13_uid279_vecTranslateTest_q <= "0010000";
            WHEN "10" => table_l13_uid279_vecTranslateTest_q <= "1110000";
            WHEN "11" => table_l13_uid279_vecTranslateTest_q <= "1010000";
            WHEN OTHERS => -- unreachable
                           table_l13_uid279_vecTranslateTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- table_l11_uid275_vecTranslateTest(LOOKUP,274)@3
    table_l11_uid275_vecTranslateTest_combproc: PROCESS (is0_uid266_vecTranslateTest_merged_bit_select_d)
    BEGIN
        -- Begin reserved scope level
        CASE (is0_uid266_vecTranslateTest_merged_bit_select_d) IS
            WHEN "0000" => table_l11_uid275_vecTranslateTest_q <= "01111000000";
            WHEN "0001" => table_l11_uid275_vecTranslateTest_q <= "01101000000";
            WHEN "0010" => table_l11_uid275_vecTranslateTest_q <= "01011000000";
            WHEN "0011" => table_l11_uid275_vecTranslateTest_q <= "01001000000";
            WHEN "0100" => table_l11_uid275_vecTranslateTest_q <= "00111000000";
            WHEN "0101" => table_l11_uid275_vecTranslateTest_q <= "00101000000";
            WHEN "0110" => table_l11_uid275_vecTranslateTest_q <= "00011000000";
            WHEN "0111" => table_l11_uid275_vecTranslateTest_q <= "00001000000";
            WHEN "1000" => table_l11_uid275_vecTranslateTest_q <= "11111000000";
            WHEN "1001" => table_l11_uid275_vecTranslateTest_q <= "11101000000";
            WHEN "1010" => table_l11_uid275_vecTranslateTest_q <= "11011000000";
            WHEN "1011" => table_l11_uid275_vecTranslateTest_q <= "11001000000";
            WHEN "1100" => table_l11_uid275_vecTranslateTest_q <= "10111000000";
            WHEN "1101" => table_l11_uid275_vecTranslateTest_q <= "10101000000";
            WHEN "1110" => table_l11_uid275_vecTranslateTest_q <= "10011000000";
            WHEN "1111" => table_l11_uid275_vecTranslateTest_q <= "10001000000";
            WHEN OTHERS => -- unreachable
                           table_l11_uid275_vecTranslateTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a1_uid283_vecTranslateTest(ADD,282)@3
    lev1_a1_uid283_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => table_l11_uid275_vecTranslateTest_q(10)) & table_l11_uid275_vecTranslateTest_q));
    lev1_a1_uid283_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 7 => table_l13_uid279_vecTranslateTest_q(6)) & table_l13_uid279_vecTranslateTest_q));
    lev1_a1_uid283_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a1_uid283_vecTranslateTest_a) + SIGNED(lev1_a1_uid283_vecTranslateTest_b));
    lev1_a1_uid283_vecTranslateTest_q <= lev1_a1_uid283_vecTranslateTest_o(11 downto 0);

    -- table_l7_uid271_vecTranslateTest(LOOKUP,270)@3
    table_l7_uid271_vecTranslateTest_combproc: PROCESS (is0_uid266_vecTranslateTest_merged_bit_select_c)
    BEGIN
        -- Begin reserved scope level
        CASE (is0_uid266_vecTranslateTest_merged_bit_select_c) IS
            WHEN "0000" => table_l7_uid271_vecTranslateTest_q <= "011101111110100";
            WHEN "0001" => table_l7_uid271_vecTranslateTest_q <= "011001111110100";
            WHEN "0010" => table_l7_uid271_vecTranslateTest_q <= "010101111110100";
            WHEN "0011" => table_l7_uid271_vecTranslateTest_q <= "010001111110100";
            WHEN "0100" => table_l7_uid271_vecTranslateTest_q <= "001101111110111";
            WHEN "0101" => table_l7_uid271_vecTranslateTest_q <= "001001111110111";
            WHEN "0110" => table_l7_uid271_vecTranslateTest_q <= "000101111110111";
            WHEN "0111" => table_l7_uid271_vecTranslateTest_q <= "000001111110111";
            WHEN "1000" => table_l7_uid271_vecTranslateTest_q <= "111110000001001";
            WHEN "1001" => table_l7_uid271_vecTranslateTest_q <= "111010000001001";
            WHEN "1010" => table_l7_uid271_vecTranslateTest_q <= "110110000001001";
            WHEN "1011" => table_l7_uid271_vecTranslateTest_q <= "110010000001001";
            WHEN "1100" => table_l7_uid271_vecTranslateTest_q <= "101110000001100";
            WHEN "1101" => table_l7_uid271_vecTranslateTest_q <= "101010000001100";
            WHEN "1110" => table_l7_uid271_vecTranslateTest_q <= "100110000001100";
            WHEN "1111" => table_l7_uid271_vecTranslateTest_q <= "100010000001100";
            WHEN OTHERS => -- unreachable
                           table_l7_uid271_vecTranslateTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- table_l3_uid267_vecTranslateTest(LOOKUP,266)@3
    table_l3_uid267_vecTranslateTest_combproc: PROCESS (is0_uid266_vecTranslateTest_merged_bit_select_b)
    BEGIN
        -- Begin reserved scope level
        CASE (is0_uid266_vecTranslateTest_merged_bit_select_b) IS
            WHEN "0000" => table_l3_uid267_vecTranslateTest_q <= "0110011110010111100";
            WHEN "0001" => table_l3_uid267_vecTranslateTest_q <= "0101011110101100101";
            WHEN "0010" => table_l3_uid267_vecTranslateTest_q <= "0100100000111100001";
            WHEN "0011" => table_l3_uid267_vecTranslateTest_q <= "0011100001010001010";
            WHEN "0100" => table_l3_uid267_vecTranslateTest_q <= "0010110000111110110";
            WHEN "0101" => table_l3_uid267_vecTranslateTest_q <= "0001110001010011111";
            WHEN "0110" => table_l3_uid267_vecTranslateTest_q <= "0000110011100011010";
            WHEN "0111" => table_l3_uid267_vecTranslateTest_q <= "1111110011111000011";
            WHEN "1000" => table_l3_uid267_vecTranslateTest_q <= "0000001100001111101";
            WHEN "1001" => table_l3_uid267_vecTranslateTest_q <= "1111001100100100110";
            WHEN "1010" => table_l3_uid267_vecTranslateTest_q <= "1110001110110100001";
            WHEN "1011" => table_l3_uid267_vecTranslateTest_q <= "1101001111001001010";
            WHEN "1100" => table_l3_uid267_vecTranslateTest_q <= "1100011110110110110";
            WHEN "1101" => table_l3_uid267_vecTranslateTest_q <= "1011011111001011111";
            WHEN "1110" => table_l3_uid267_vecTranslateTest_q <= "1010100001011011011";
            WHEN "1111" => table_l3_uid267_vecTranslateTest_q <= "1001100001110000100";
            WHEN OTHERS => -- unreachable
                           table_l3_uid267_vecTranslateTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0_uid282_vecTranslateTest(ADD,281)@3
    lev1_a0_uid282_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => table_l3_uid267_vecTranslateTest_q(18)) & table_l3_uid267_vecTranslateTest_q));
    lev1_a0_uid282_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 15 => table_l7_uid271_vecTranslateTest_q(14)) & table_l7_uid271_vecTranslateTest_q));
    lev1_a0_uid282_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid282_vecTranslateTest_a) + SIGNED(lev1_a0_uid282_vecTranslateTest_b));
    lev1_a0_uid282_vecTranslateTest_q <= lev1_a0_uid282_vecTranslateTest_o(19 downto 0);

    -- lev2_a0_uid284_vecTranslateTest(ADD,283)@3
    lev2_a0_uid284_vecTranslateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => lev1_a0_uid282_vecTranslateTest_q(19)) & lev1_a0_uid282_vecTranslateTest_q));
    lev2_a0_uid284_vecTranslateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 12 => lev1_a1_uid283_vecTranslateTest_q(11)) & lev1_a1_uid283_vecTranslateTest_q));
    lev2_a0_uid284_vecTranslateTest_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid284_vecTranslateTest_a) + SIGNED(lev2_a0_uid284_vecTranslateTest_b));
    lev2_a0_uid284_vecTranslateTest_q <= lev2_a0_uid284_vecTranslateTest_o(20 downto 0);

    -- atanRes_uid285_vecTranslateTest(BITSELECT,284)@3
    atanRes_uid285_vecTranslateTest_in <= lev2_a0_uid284_vecTranslateTest_q(18 downto 0);
    atanRes_uid285_vecTranslateTest_b <= atanRes_uid285_vecTranslateTest_in(18 downto 4);

    -- xNotZero_uid17_vecTranslateTest(LOGICAL,16)@0 + 1
    xNotZero_uid17_vecTranslateTest_qi <= "1" WHEN x /= "0000000000000" ELSE "0";
    xNotZero_uid17_vecTranslateTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xNotZero_uid17_vecTranslateTest_qi, xout => xNotZero_uid17_vecTranslateTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist19_xNotZero_uid17_vecTranslateTest_q_3(DELAY,330)
    redist19_xNotZero_uid17_vecTranslateTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xNotZero_uid17_vecTranslateTest_q, xout => redist19_xNotZero_uid17_vecTranslateTest_q_3_q, ena => en(0), clk => clk, aclr => areset );

    -- xZero_uid18_vecTranslateTest(LOGICAL,17)@3
    xZero_uid18_vecTranslateTest_q <= not (redist19_xNotZero_uid17_vecTranslateTest_q_3_q);

    -- yNotZero_uid15_vecTranslateTest(LOGICAL,14)@0 + 1
    yNotZero_uid15_vecTranslateTest_qi <= "1" WHEN y /= "0000000000000" ELSE "0";
    yNotZero_uid15_vecTranslateTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yNotZero_uid15_vecTranslateTest_qi, xout => yNotZero_uid15_vecTranslateTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist20_yNotZero_uid15_vecTranslateTest_q_3(DELAY,331)
    redist20_yNotZero_uid15_vecTranslateTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yNotZero_uid15_vecTranslateTest_q, xout => redist20_yNotZero_uid15_vecTranslateTest_q_3_q, ena => en(0), clk => clk, aclr => areset );

    -- yZero_uid16_vecTranslateTest(LOGICAL,15)@3
    yZero_uid16_vecTranslateTest_q <= not (redist20_yNotZero_uid15_vecTranslateTest_q_3_q);

    -- concXZeroYZero_uid292_vecTranslateTest(BITJOIN,291)@3
    concXZeroYZero_uid292_vecTranslateTest_q <= xZero_uid18_vecTranslateTest_q & yZero_uid16_vecTranslateTest_q;

    -- atanResPostExc_uid293_vecTranslateTest(MUX,292)@3
    atanResPostExc_uid293_vecTranslateTest_s <= concXZeroYZero_uid292_vecTranslateTest_q;
    atanResPostExc_uid293_vecTranslateTest_combproc: PROCESS (atanResPostExc_uid293_vecTranslateTest_s, en, atanRes_uid285_vecTranslateTest_b, cstZeroOutFormat_uid286_vecTranslateTest_q, constPio2P2u_mergedSignalTM_uid290_vecTranslateTest_q)
    BEGIN
        CASE (atanResPostExc_uid293_vecTranslateTest_s) IS
            WHEN "00" => atanResPostExc_uid293_vecTranslateTest_q <= atanRes_uid285_vecTranslateTest_b;
            WHEN "01" => atanResPostExc_uid293_vecTranslateTest_q <= cstZeroOutFormat_uid286_vecTranslateTest_q;
            WHEN "10" => atanResPostExc_uid293_vecTranslateTest_q <= constPio2P2u_mergedSignalTM_uid290_vecTranslateTest_q;
            WHEN "11" => atanResPostExc_uid293_vecTranslateTest_q <= cstZeroOutFormat_uid286_vecTranslateTest_q;
            WHEN OTHERS => atanResPostExc_uid293_vecTranslateTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- constantZeroOutFormat_uid297_vecTranslateTest(CONSTANT,296)
    constantZeroOutFormat_uid297_vecTranslateTest_q <= "000000000000000";

    -- redist22_signX_uid7_vecTranslateTest_b_3(DELAY,333)
    redist22_signX_uid7_vecTranslateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid7_vecTranslateTest_b, xout => redist22_signX_uid7_vecTranslateTest_b_3_q, ena => en(0), clk => clk, aclr => areset );

    -- redist21_signY_uid8_vecTranslateTest_b_3(DELAY,332)
    redist21_signY_uid8_vecTranslateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => signY_uid8_vecTranslateTest_b, xout => redist21_signY_uid8_vecTranslateTest_b_3_q, ena => en(0), clk => clk, aclr => areset );

    -- concSigns_uid294_vecTranslateTest(BITJOIN,293)@3
    concSigns_uid294_vecTranslateTest_q <= redist22_signX_uid7_vecTranslateTest_b_3_q & redist21_signY_uid8_vecTranslateTest_b_3_q;

    -- secondOperand_uid301_vecTranslateTest(MUX,300)@3
    secondOperand_uid301_vecTranslateTest_s <= concSigns_uid294_vecTranslateTest_q;
    secondOperand_uid301_vecTranslateTest_combproc: PROCESS (secondOperand_uid301_vecTranslateTest_s, en, constantZeroOutFormat_uid297_vecTranslateTest_q, atanResPostExc_uid293_vecTranslateTest_q, constPi_uid296_vecTranslateTest_q)
    BEGIN
        CASE (secondOperand_uid301_vecTranslateTest_s) IS
            WHEN "00" => secondOperand_uid301_vecTranslateTest_q <= constantZeroOutFormat_uid297_vecTranslateTest_q;
            WHEN "01" => secondOperand_uid301_vecTranslateTest_q <= atanResPostExc_uid293_vecTranslateTest_q;
            WHEN "10" => secondOperand_uid301_vecTranslateTest_q <= atanResPostExc_uid293_vecTranslateTest_q;
            WHEN "11" => secondOperand_uid301_vecTranslateTest_q <= constPi_uid296_vecTranslateTest_q;
            WHEN OTHERS => secondOperand_uid301_vecTranslateTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- constPiP2u_uid295_vecTranslateTest(CONSTANT,294)
    constPiP2u_uid295_vecTranslateTest_q <= "110010010001011";

    -- constantZeroOutFormatP2u_uid298_vecTranslateTest(CONSTANT,297)
    constantZeroOutFormatP2u_uid298_vecTranslateTest_q <= "000000000000100";

    -- firstOperand_uid300_vecTranslateTest(MUX,299)@3
    firstOperand_uid300_vecTranslateTest_s <= concSigns_uid294_vecTranslateTest_q;
    firstOperand_uid300_vecTranslateTest_combproc: PROCESS (firstOperand_uid300_vecTranslateTest_s, en, atanResPostExc_uid293_vecTranslateTest_q, constantZeroOutFormatP2u_uid298_vecTranslateTest_q, constPiP2u_uid295_vecTranslateTest_q)
    BEGIN
        CASE (firstOperand_uid300_vecTranslateTest_s) IS
            WHEN "00" => firstOperand_uid300_vecTranslateTest_q <= atanResPostExc_uid293_vecTranslateTest_q;
            WHEN "01" => firstOperand_uid300_vecTranslateTest_q <= constantZeroOutFormatP2u_uid298_vecTranslateTest_q;
            WHEN "10" => firstOperand_uid300_vecTranslateTest_q <= constPiP2u_uid295_vecTranslateTest_q;
            WHEN "11" => firstOperand_uid300_vecTranslateTest_q <= atanResPostExc_uid293_vecTranslateTest_q;
            WHEN OTHERS => firstOperand_uid300_vecTranslateTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outResExtended_uid302_vecTranslateTest(SUB,301)@3
    outResExtended_uid302_vecTranslateTest_a <= STD_LOGIC_VECTOR("0" & firstOperand_uid300_vecTranslateTest_q);
    outResExtended_uid302_vecTranslateTest_b <= STD_LOGIC_VECTOR("0" & secondOperand_uid301_vecTranslateTest_q);
    outResExtended_uid302_vecTranslateTest_o <= STD_LOGIC_VECTOR(UNSIGNED(outResExtended_uid302_vecTranslateTest_a) - UNSIGNED(outResExtended_uid302_vecTranslateTest_b));
    outResExtended_uid302_vecTranslateTest_q <= outResExtended_uid302_vecTranslateTest_o(15 downto 0);

    -- atanResPostRR_uid303_vecTranslateTest(BITSELECT,302)@3
    atanResPostRR_uid303_vecTranslateTest_b <= STD_LOGIC_VECTOR(outResExtended_uid302_vecTranslateTest_q(15 downto 2));

    -- xOut(GPOUT,4)@3
    q <= atanResPostRR_uid303_vecTranslateTest_b;
    r <= outMag_uid309_vecTranslateTest_b;

END normal;
