# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand


def gen_arbiter_checker_top(checker_id):
    name_string = ""
    for i in checker_id:
        name_string += str(i)+"_"
    arbiter_checker_top = open("checker_vhdl/arbiter_checker"+name_string[:len(name_string)-1]+"_top.vhd", 'w')

    arbiter_checker_top.close()
