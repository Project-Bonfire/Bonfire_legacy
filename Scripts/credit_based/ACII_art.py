# Copyright (C) 2016 Siavoosh Payandeh Azad


def generate_ascii_art(noc_file, network_dime, FI):

    noc_file.write("\n\n")
    noc_file.write("--        organizaiton of the network:\n")
    noc_file.write("--     x --------------->\n")
    for j in range(0, network_dime):
        if j == 0:
            noc_file.write("--  y  ")
        else:
            noc_file.write("--  |  ")
        for i in range(0, network_dime):
            noc_file.write("       ----")
        noc_file.write("\n")
        noc_file.write("--  |       ")
        for i in range(0, network_dime):
            if i != network_dime-1:
                link = "---"
                if FI: 
                    link = "-*-"
                if (i+network_dime*j) >= 10:
                    noc_file.write(" | "+str(i+network_dime*j)+" | "+link)
                else:
                    noc_file.write(" | "+str(i+network_dime*j)+"  | "+link)
            else:
                if (i+network_dime*j) >= 10:
                    noc_file.write(" | "+str(i+network_dime*j)+" |")
                else:
                    noc_file.write(" | "+str(i+network_dime*j)+"  |")

        noc_file.write("\n")
        link = "|"
        if FI:
            link = "*"
        if j == network_dime-1:
            noc_file.write("--  v  ")
        else:
            noc_file.write("--  |  ")
        for i in range(0, network_dime):
            noc_file.write("       ----")

        if j == network_dime-1:
            noc_file.write("\n--   ")
            for i in range(0, network_dime):
                noc_file.write("           ")
        else:
            noc_file.write("\n--  |")
            for i in range(0, network_dime):
                noc_file.write("          "+link)

        noc_file.write("\n")
