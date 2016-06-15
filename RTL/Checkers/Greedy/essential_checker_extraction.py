# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file


def extract_checker_info(name_string):
    package_file.list_of_detection_info_sa0[name_string]=[]
    package_file.list_of_detection_info_sa1[name_string]=[]
    area_report_file = open("coverage_results/fstat"+str(name_string), 'r')
    line = area_report_file.readline()
    while line != "":
        line = area_report_file.readline()
        if ".CHECKERS DETECTION INFO - amount of detections" in line:
            line = area_report_file.readline()
            for item in  line.split(" "):
                if "|" in item:
                    package_file.list_of_detection_info_sa0[name_string].append(item.split("|")[0])
                    package_file.list_of_detection_info_sa1[name_string].append(item.split("|")[1])
            break
    print package_file.list_of_detection_info_sa0
    print package_file.list_of_detection_info_sa1
    return None


def find_essential_checker():
    list_of_essential_checkers=[]

    random_item = package_file.list_of_detection_info_sa0.keys()[0]
    number_of_nodes = len(package_file.list_of_detection_info_sa0[random_item])
    for node in range(0, number_of_nodes):
        detecting_checkers = []
        for checker in package_file.list_of_detection_info_sa0.keys():
            if package_file.list_of_detection_info_sa0[checker][node] != 0:
                detecting_checkers.append(checker)
        if len(detecting_checkers) == 0:
            print "non detectable node found(SA0):", node
        if len(detecting_checkers) == 1:
            print "essential checker found:", detecting_checkers[0]
            if detecting_checkers[0] not in list_of_essential_checkers:
                list_of_essential_checkers.append(detecting_checkers[0])

    for node in range(0, number_of_nodes):
        detecting_checkers = []
        for checker in package_file.list_of_detection_info_sa1.keys():
            if package_file.list_of_detection_info_sa1[checker][node] != 0:
                detecting_checkers.append(checker)
        if len(detecting_checkers) == 0:
            print "non detectable node found(SA1):", node
        if len(detecting_checkers) == 1:
            print "essential checker found:", detecting_checkers[0]
            if detecting_checkers[0] not in list_of_essential_checkers:
                list_of_essential_checkers.append(detecting_checkers[0])

    return list_of_essential_checkers