# Copyright (C) 2016 Siavoosh Payandeh Azad
from math import ceil, log


class CreditBasedPackage():

    def __init__(self):
        self.network_dime = None
        self.data_width = 32
        self.add_parity = False
        self.network_dime = 4
        self.add_LV = False
        self.add_SHMU = False
        self.add_FO = False
        self.fi_addres_width = None
        self.add_FI = False

    def sort_out_parameters(self, arguments_list):
        if '--help' in arguments_list:
            print "\t-D [network size]: it makes a network of [size]X[size]. Size can be only multiples of two. " \
                  "default value is 4."
            print "\t-DW [data_width]: sets the data width of the network!"
            print "\t-P: adds parity to the network"
            print "\t-FI: adds fault injector units to all the links (except the local) in the network"
            print "\t-FO: takes the fault/health packet signals (output of parity units) to interface"
            print "\t-SHMU: adds SHMU to the network as a component and connects parity units outputs to them"
            print "\t-LV: adds light weight network to the network"
            print "\t-o: specifies the name and path of the output file. default path is current folder!"
            print "\t**Example: python network_gen_parameterized.py -D 2 -o ../output.vhd"
            print "\t           generates a 2X2 network that has network interface and parity checker and fault " \
                  "injectors into ../output.vhd"
            return 1
        if '-D' in arguments_list:
            network_dime = int(arguments_list[arguments_list.index('-D')+1])
            if network_dime % 2 != 0:
                raise ValueError("wrong network size. please choose powers of 2. for example 4!")

        if '-DW' in arguments_list:
            data_width = int(arguments_list[arguments_list.index('-DW')+1])
            if data_width % 2 != 0:
                raise ValueError("wrong data width. please choose powers of 2. for example 32!")

        if '-P' in arguments_list:
            self.add_parity = True

        if '-FI' in arguments_list:
            self.add_FI = True
            self.fi_addres_width = int(ceil(log(self.data_width, 2)))

        if self.add_parity and '-SHMU' in arguments_list:
            self.add_SHMU = True

        if "LV" in arguments_list:
            self.add_LV = True

        if '-FO' in arguments_list:
            self.add_FO = True
        return 0

    def parameters_sanity_check(self):
        if self.add_parity and self.add_SHMU and not self.add_FO:
            raise ValueError("look mate, you can not have SHMU and FO at the same time! just saying...")

        if self.add_LV and (self.add_SHMU or self.add_FO):
            raise ValueError("If you are using LV netwrok, then you should not use the SHMU or FO switches!")

    def generate_file_name(self, arguments_list):
        file_name= 'network'
        if self.add_parity:
            file_name += '_parity'
        if self.add_FI:
            file_name += '_FI'
        if self.add_SHMU:
            file_name += '_SHMU'

        if '-o'  in arguments_list:
            file_path = arguments_list[arguments_list.index('-o')+1]
            if ".vhd" not in file_path:
                raise ValueError("wrong file extention. only vhdl files are accepted!")
        else:
            file_path = file_name+'_'+str(self.network_dime)+"x"+str(self.network_dime)+'.vhd'
        return file_path