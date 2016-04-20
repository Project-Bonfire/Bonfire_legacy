Authors:

* Siavoosh Payandeh Azad
* Behrad Niazmand

License:  	GNU GENERAL PUBLIC LICENSE Version 3

-------------------------------------------------------------------------------------------------
	Copyright (C) 2016 as collective work done by Siavoosh Payandeh Azad and Behrad Niazmand
-------------------------------------------------------------------------------------------------

This project implements a simple NoC router which does not use any Virtual Channels (VCs). The router is intended for a 2D Network on-chip and has 5 input and 5 output ports (North-N, East-E, West-W, South-S and Local-L). It is composed of the following components: 

- Input buffer implemented as First-In-First-Out (FIFO) per each input port
- Routing computation unit implemented using Logic-Based Distributed Routing (LBDR) (no need for using routing table) per each input port
- Arbitration unit (Arbiter) implemented using a Finite State Machine (FSM) based on Round-Robin (RR) prioritization, per each output port
- Crossbar Switch (Xbar) implemented as Multiplexers (MUX) per each output port

The folder structure of the project is as follows: 

"RTL" folder : includes the VHDL RTL files for the FIFO, LBDR, Arbiter, Xbar and the Router (as top module).

"scripts" folder : includes scripts in Python for :
	* Generation of customized routers (with some ports not existing, depending on the location of the router in the network) (customized_router_gen.py)
	* Generation of a Network-on-Chip in VHDL, consisting of the routers in generic mode (network_gen_generic.py)
	* Generation of a Network-on-Chip in VHDL, consisting of the routers in customized mode (network_gen_customized.py)
	* Generation of Test-bench in VHDL for the network of routers in generic mode (network_tb_gen_generic.py)
	* Generation of waves for simulation of the whole network using Mentor Graphics ModelSim

"TB" folder : includes individual Test-benches for different modules of the router (FIFO, Arbiter and the Router as top module)
			  This folder also includes the "TB_Package.vhd" file which defines the functions and procedures defined in VHDL for generation and reception of packets during simulation (used for implementing traffic patterns)

-------------------------------------------------------------------------------------------------