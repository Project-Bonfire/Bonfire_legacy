# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand


def name_string_generator(list_of_checkers):
    name_string = ""
    for i in sorted(list_of_checkers):
        name_string += str(i)+"_"
    name_string = name_string[:len(name_string)-1]
    return name_string