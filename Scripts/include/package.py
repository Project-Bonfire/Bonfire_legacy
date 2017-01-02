
"""
Constant declarations
"""
# Root directory
import os

PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))[:-16]
print PROJECT_ROOT

# Better safe than sorry
os.chdir(PROJECT_ROOT)

# Temporary directory for storing simulation files
TMP_DIR = PROJECT_ROOT + "/tmp"
SIMUL_DIR = TMP_DIR + "/simul_temp"

# Subfolders
SCRIPTS_DIR = PROJECT_ROOT + "/Scripts"
TEST_DIR = PROJECT_ROOT + "/Test"
ROUTER_RTL_DIR = PROJECT_ROOT + "/RTL/Router"
FAULT_MANAGEMENT_RTL_DIR = PROJECT_ROOT + "/RTL/Fault_Management"
CHECKERS_DIR = "/Checkers/Modules_with_checkers_integrated/All_checkers"

# Flow control suffixes
HANDSHAKING_SUFFIX = "handshaking"
CREDIT_BASED_SUFFIX = "credit_based"

# Script names
NET_GEN_SCRIPT = "network_gen_parameterized"
NET_TB_GEN_SCRIPT = "network_tb_gen_parameterized"
WAVE_DO_GEN_SCRIPT = "wave_do_gen"
SIMUL_DO_SCRIPT = "simulate.do"
RECEIVED_TXT_PATH = "received.txt"
SENT_TXT_PATH = "sent.txt"
LATENCY_CALCULATION_PATH = "calculate_latency.py"

# Debug mode is off by default
DEBUG = False