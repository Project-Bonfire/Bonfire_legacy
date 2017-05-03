Authors:

  * Siavoosh Payandeh Azad
  * Karl Janson
  * Behrad Niazmand
  * Tsotne Putkaradze
  * Nevin George 
  * Stephen Adeboye Oyeniran 
  * Konstantin Shibin

If you use Bonfire in your research work, we would appreciate the following paper to be cited in any publications to which Bonfire has contributed to:

* From Online Fault Detection to Fault Management in Network-on-Chips: A Ground-Up Approach. Siavoosh Payandeh Azad, Behrad Niazmand, Karl Janson, Nevin George, Adeboye Stephen Oyeniran, Tsotne Putkaradze,Apneet Kaur, Jaan Raik, Gert Jervan, Raimund Ubar, Thomas Hollstein, DDECS 2017

----------

License:  	GNU GENERAL PUBLIC LICENSE Version 3

----------------------------------------------------------------------------------------------------------------------------
	Copyright (C) 2016 as collective work done by Siavoosh Payandeh Azad, Karl Janson, Behrad Niazmand and Tsotne Putkaradze
	Parts of this work are re-use or modification of work under different licenses. Please refer to disclaimers in the related folders.
----------------------------------------------------------------------------------------------------------------------------

This project implements a simple NoC router which does not use any Virtual Channels (VCs). The router is intended for a 2D Network on-chip and has 5 input and 5 output ports (North-N, East-E, West-W, South-S and Local-L). It is composed of the following components:

- Input buffer implemented as First-In-First-Out (FIFO) per each input port
- Routing computation unit implemented using Logic-Based Distributed Routing (LBDR) (no need for using routing table) per each input port
- Arbitration unit (Arbiter) implemented using a Finite State Machine (FSM) based on Round-Robin (RR) prioritization, per each output port
- Crossbar Switch (Xbar) implemented as Multiplexers (MUX) per each output port

Two versions of the router exist: a handshaking based flow-control and credit based flow-control. 
----------------------------------------------------------------------------------------------------------------------------

The general folder structure of the project is as follows:

Bonfire  
&nbsp; &nbsp; &nbsp; |  
&nbsp; &nbsp; &nbsp; +- RTL - VHDL RTL files for the components  
&nbsp; &nbsp; &nbsp; |  
&nbsp; &nbsp; &nbsp; +- Scripts - Includes scripts for simulation  
&nbsp; &nbsp; &nbsp; |  
&nbsp; &nbsp; &nbsp; +- Test - Testing-related files (VHDL testbenches etc.)  
&nbsp; &nbsp; &nbsp; |  
&nbsp; &nbsp; &nbsp; +- Tools - Supporting tools that are not directly part of the design  
