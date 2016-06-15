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
            if int(package_file.list_of_detection_info_sa0[checker][node]) != 0:
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
            if (package_file.list_of_detection_info_sa1[checker][node]) != 0:
                detecting_checkers.append(checker)
        if len(detecting_checkers) == 0:
            print "non detectable node found(SA1):", node
        if len(detecting_checkers) == 1:
            print "essential checker found:", detecting_checkers[0]
            if detecting_checkers[0] not in list_of_essential_checkers:
                list_of_essential_checkers.append(detecting_checkers[0])

    return list_of_essential_checkers


def find_dominant_checker():
    print "-------------------------------------------------------------"
    list_of_dominance = []
    candidates_for_deletion = []
    for checker1 in package_file.list_of_detection_info_sa0:
        for checker2 in package_file.list_of_detection_info_sa0:
            if checker1 != checker2:
                dominant = True
                for node in range(0, len(package_file.list_of_detection_info_sa0[checker1])):
                    checker1_value = int(package_file.list_of_detection_info_sa0[checker1][node])
                    checker2_value = int(package_file.list_of_detection_info_sa0[checker2][node])
                    if checker1_value > checker2_value:
                        dominant = False
                for node in range(0, len(package_file.list_of_detection_info_sa1[checker1])):
                    checker1_value = int(package_file.list_of_detection_info_sa1[checker1][node])
                    checker2_value = int(package_file.list_of_detection_info_sa1[checker2][node])
                    if checker1_value > checker2_value:
                        dominant = False
                if dominant:
                    list_of_dominance.append([checker2, checker1])
                    print "checker", checker2, "dominates checker", checker1
    print "-------------------------"
    for item in list_of_dominance:
        reversed_item = [item[1], item[0]]
        if reversed_item in list_of_dominance:
            print item[1], item[0], "are essentially the same!"
            area_item_0 = package_file.list_of_candidates[item[0]]
            area_item_1 = package_file.list_of_candidates[item[1]]
            if area_item_1 > area_item_0:
                list_of_dominance.remove(reversed_item)
            else:
                list_of_dominance.remove(item)

    print "final list of dominance:", list_of_dominance
    for item in list_of_dominance:
        if item[1] not in candidates_for_deletion:
            candidates_for_deletion.append(item[1])
        if item[1] in package_file.list_of_detection_info_sa0:
            package_file.list_of_detection_info_sa0.pop(item[1])
            print "removed", item[1], "from list_of_detection_info_sa0"
        if item[1] in package_file.list_of_detection_info_sa1:
            package_file.list_of_detection_info_sa1.pop(item[1])
            print "removed", item[1], "from list_of_detection_info_sa1"
    print "candidates for deletion:", candidates_for_deletion
    return candidates_for_deletion
