# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

def gen_arbiter_checkers(checker_id):
    name_string = ""
    for i in checker_id:
        name_string += str(i) + "_"
    arbiter_checker_vhd = open("checker_vhdl/arbiter_checker" + name_string[:len(name_string) - 1] + ".vhd", 'w')



    arbiter_checker_vhd.close()