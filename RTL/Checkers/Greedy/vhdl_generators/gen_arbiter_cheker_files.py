# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
from misc import name_string_generator


def gen_arbiter_checkers(checker_id):
    name_string = name_string_generator(checker_id)
    arbiter_checker_vhd = open("checker_vhdl/arbiter_checker" + name_string + ".vhd", 'w')



    arbiter_checker_vhd.close()