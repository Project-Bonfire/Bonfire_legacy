# Copyright (C) 2016 Siavoosh Payandeh Azad
from math import ceil, log



class CreditBasedPackage():
    """
    This class handles all the program arguments.
    sort_out_parameters: function for setting up the argument list and also printing the manual if needed!
    parameters_sanity_check: TODO
    generate_file_name: handles generating the file name for output file
    """

    def __init__(self):
        self.network_dime = None
        self.data_width = 32
        self.add_parity = False
        self.network_dime = 4
        self.faulty_counter_threshold = 3
        self.healthy_counter_threshold = 15
        self.counter_depth = 4
        self.add_packet_drop = False
        self.add_FC = False
        self.add_SHMU = False
        self.add_tracker = False

    def sort_out_parameters(self, arguments_list):

        if '--help' in arguments_list:
            print "\t-D [network size]: it makes a network of [size]X[size]. Size can be only multiples of two. " \
                  "default value is 4."
            print "\t-DW [data_width]: sets the data width of the network!"
            print "\t-P: adds parity to the network"
            print "\t-FI: adds fault injector units to all the links (except the local) in the network"
            print "\t-FC: adds fault classifier units to all the links (except the local) in the network"
            print "\t-SHMU: uses different NI that can pass information to SHMU nodes"
            print "\t-o: specifies the name and path of the output file. default path is current folder!"
            print "\t**Example: python network_gen_parameterized.py -D 2 -o ../output.vhd"
            print "\t           generates a 2X2 network that has network interface and parity checker and fault " \
                  "injectors into ../output.vhd"
            return 1
        if '-D' in arguments_list:
            self.network_dime = int(arguments_list[arguments_list.index('-D')+1])
            if self.network_dime % 2 != 0:
                raise ValueError("wrong network size. please choose powers of 2. for example 4!")

        if '-DW' in arguments_list:
            self.data_width = int(arguments_list[arguments_list.index('-DW')+1])
            if self.data_width % 2 != 0:
                raise ValueError("wrong data width. please choose powers of 2. for example 32!")

        if '-P' in arguments_list:
            self.add_parity = True

        if '-PD' in arguments_list:
            self.add_packet_drop = True

        if '-FC' in arguments_list:
            self.add_FC = True

        if '-SHMU' in arguments_list:
            self.add_SHMU = True

        if "-trace" in arguments_list:
            self.add_tracker = True
        return 0

    def parameters_sanity_check(self):

        pass

    def generate_file_name(self, arguments_list):
        file_name= 'network'
        if self.add_parity:
            file_name += '_parity'
        if self.add_SHMU:
            file_name += '_SHMU'

        if '-o'  in arguments_list:
            file_path = arguments_list[arguments_list.index('-o')+1]
            if ".vhd" not in file_path:
                raise ValueError("wrong file extension. only vhdl files are accepted!")
        else:
            file_path = file_name+'_'+str(self.network_dime)+"x"+str(self.network_dime)+'.vhd'
        return file_path