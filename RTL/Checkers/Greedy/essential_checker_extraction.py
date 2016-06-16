# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file
import copy

def extract_checker_info(name_string):
    package_file.list_of_detection_info_sa0[name_string]=[]
    package_file.list_of_detection_info_sa1[name_string]=[]

    package_file.list_of_true_misses_sa0[name_string]=[]
    package_file.list_of_true_misses_sa1[name_string]=[]
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
        if "amount of True Misses" in line:
            line = area_report_file.readline()
            for item in  line.split(" "):
                if "|" in item:
                    package_file.list_of_true_misses_sa0[name_string].append(item.split("|")[0])
                    package_file.list_of_true_misses_sa1[name_string].append(item.split("|")[1])
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
                candidates_for_deletion.append(item[1])
                package_file.list_of_detection_info_sa0.pop(item[1])
                package_file.list_of_detection_info_sa1.pop(item[1])
            else:
                list_of_dominance.remove(item)
                candidates_for_deletion.append(item[0])
                package_file.list_of_detection_info_sa0.pop(item[0])
                package_file.list_of_detection_info_sa1.pop(item[0])

    print "final list of dominance:", list_of_dominance
    #for item in list_of_dominance:
    #    if item[1] not in candidates_for_deletion:
    #        candidates_for_deletion.append(item[1])
    #    if item[1] in package_file.list_of_detection_info_sa0:
    #        package_file.list_of_detection_info_sa0.pop(item[1])
    #        print "removed", item[1], "from list_of_detection_info_sa0"
    #    if item[1] in package_file.list_of_detection_info_sa1:
    #        package_file.list_of_detection_info_sa1.pop(item[1])
    #        print "removed", item[1], "from list_of_detection_info_sa1"
    print "candidates for deletion:", candidates_for_deletion
    return candidates_for_deletion


def cleanup_checker_selection():
    temp_copy_sa0 = copy.deepcopy(package_file.list_of_detection_info_sa0)
    temp_copy_sa1 = copy.deepcopy(package_file.list_of_detection_info_sa1)

    random_item = temp_copy_sa0.keys()[0]

    selected_checkers_sa0 = []
    selected_checkers_sa1 = []
    checkers_for_optimization =[]

    for node in range(0, len(temp_copy_sa0[random_item])):
        best_checker = None
        best_detection = 0
        for checker in temp_copy_sa0:
            detection_rate = int(temp_copy_sa0[checker][node])
            if detection_rate > 0:
                if detection_rate > best_detection:
                    best_detection = detection_rate
                    best_checker = checker
        if best_detection > 0:
            count = 0
            for checker in temp_copy_sa0:
                if int(package_file.list_of_detection_info_sa0[checker][node]) == best_detection:
                    temp_copy_sa0[checker][node] = 1
                    count += 1
                else:
                    temp_copy_sa0[checker][node] = 0
            if count == 1:
                if best_checker not in selected_checkers_sa0:
                    selected_checkers_sa0.append(best_checker)
        else:
            for checker in temp_copy_sa0:
                temp_copy_sa0[checker][node] = 0

    print "single dominant checkers for sta0:", selected_checkers_sa0
    for node in range(0, len(temp_copy_sa1[random_item])):
        best_checker = None
        best_detection = 0
        for checker in temp_copy_sa1:
            detection_rate = int(temp_copy_sa1[checker][node])
            if detection_rate > 0:
                if detection_rate > best_detection:
                    best_detection = detection_rate
                    best_checker = checker
        if best_detection > 0:
            count = 0
            for checker in temp_copy_sa1:
                if int(package_file.list_of_detection_info_sa1[checker][node]) == best_detection:
                    temp_copy_sa1[checker][node] = 1
                    count += 1
                else:
                    temp_copy_sa1[checker][node] = 0
            if count == 1:
                if best_checker not in selected_checkers_sa1:
                    selected_checkers_sa1.append(best_checker)
        else:
            for checker in temp_copy_sa1:
                temp_copy_sa1[checker][node] = 0

    print "single dominant checkers for sta1:", selected_checkers_sa1
    for checker in selected_checkers_sa0:
        for node in range(0, len(temp_copy_sa0[checker])):
            if temp_copy_sa0[checker][node] == 1:
                for checker2 in temp_copy_sa0.keys():
                    if checker2 not in selected_checkers_sa0:
                        if temp_copy_sa0[checker2][node] == 1:
                            temp_copy_sa0[checker2][node] = 0

    for checker in selected_checkers_sa1:
        for node in range(0, len(temp_copy_sa1[checker])):
            if temp_copy_sa1[checker][node] == 1:
                for checker2 in temp_copy_sa1.keys():
                    if checker2 not in selected_checkers_sa1:
                        if temp_copy_sa1[checker2][node] == 1:
                            temp_copy_sa1[checker2][node] = 0

    for item in temp_copy_sa1:
        if item not in selected_checkers_sa1:
            if sum(temp_copy_sa1[item])>0:
                if item not in checkers_for_optimization:
                    checkers_for_optimization.append(item)

    for item in temp_copy_sa0:
        if item not in selected_checkers_sa0:
            if sum(temp_copy_sa0[item])>0:
                if item not in checkers_for_optimization:
                    checkers_for_optimization.append(item)


    print "-----------------"
    for checker in sorted(temp_copy_sa0.keys()):
        print checker,
        for item in temp_copy_sa0[checker]:
            print item,
        print ""
    print "-----------------"
    for checker in sorted(temp_copy_sa1.keys()):
        print checker,
        for item in temp_copy_sa1[checker]:
            print item,
        print ""

    final_selected_list = copy.deepcopy(selected_checkers_sa0)
    for item in selected_checkers_sa1:
        if item not in selected_checkers_sa1:
            final_selected_list.append(item)

    print "selected single dominant checkers:", final_selected_list
    print "selected checkers for optimization:", checkers_for_optimization
    return final_selected_list, checkers_for_optimization



def cleanup_true_miss_selection():
    temp_copy_sa0 = copy.deepcopy(package_file.list_of_true_misses_sa0)
    temp_copy_sa1 = copy.deepcopy(package_file.list_of_true_misses_sa1)

    random_item = temp_copy_sa0.keys()[0]

    selected_checkers_sa0 = []
    selected_checkers_sa1 = []
    checkers_for_optimization =[]

    for node in range(0, len(temp_copy_sa0[random_item])):
        best_checker = None
        best_true_miss_rate = float('inf')
        for checker in temp_copy_sa0:
            true_miss_rate = int(temp_copy_sa0[checker][node])
            if true_miss_rate >= 0:
                if true_miss_rate < best_true_miss_rate:
                    best_true_miss_rate = true_miss_rate
                    best_checker = checker
        if best_true_miss_rate == 0:
            count = 0
            for checker in temp_copy_sa0:
                if int(package_file.list_of_true_misses_sa0[checker][node]) == best_true_miss_rate:
                    temp_copy_sa0[checker][node] = 1
                    count += 1
                else:
                    temp_copy_sa0[checker][node] = 0
            if count == 1:
                if best_checker not in selected_checkers_sa0:
                    selected_checkers_sa0.append(best_checker)
        else:
            for checker in temp_copy_sa0:
                temp_copy_sa0[checker][node] = 0

    print "single dominant checkers for sta0:", selected_checkers_sa0
    for node in range(0, len(temp_copy_sa1[random_item])):
        best_checker = None
        best_true_miss_rate = float('inf')
        for checker in temp_copy_sa1:
            true_miss_rate = int(temp_copy_sa1[checker][node])
            if true_miss_rate >= 0:
                if true_miss_rate < best_true_miss_rate:
                    best_true_miss_rate = true_miss_rate
                    best_checker = checker
        if best_true_miss_rate == 0:
            count = 0
            for checker in temp_copy_sa1:
                if int(package_file.list_of_true_misses_sa1[checker][node]) == best_true_miss_rate:
                    temp_copy_sa1[checker][node] = 1
                    count += 1
                else:
                    temp_copy_sa1[checker][node] = 0
            if count == 1:
                if best_checker not in selected_checkers_sa1:
                    selected_checkers_sa1.append(best_checker)
        else:
            for checker in temp_copy_sa1:
                temp_copy_sa1[checker][node] = 0

    print "single dominant checkers for sta1:", selected_checkers_sa1
    for checker in selected_checkers_sa0:
        for node in range(0, len(temp_copy_sa0[checker])):
            if temp_copy_sa0[checker][node] == 1:
                for checker2 in temp_copy_sa0.keys():
                    if checker2 not in selected_checkers_sa0:
                        if temp_copy_sa0[checker2][node] == 1:
                            temp_copy_sa0[checker2][node] = 0

    for checker in selected_checkers_sa1:
        for node in range(0, len(temp_copy_sa1[checker])):
            if temp_copy_sa1[checker][node] == 1:
                for checker2 in temp_copy_sa1.keys():
                    if checker2 not in selected_checkers_sa1:
                        if temp_copy_sa1[checker2][node] == 1:
                            temp_copy_sa1[checker2][node] = 0

    for item in temp_copy_sa1:
        if item not in selected_checkers_sa1:
            if sum(temp_copy_sa1[item])>0:
                if item not in checkers_for_optimization:
                    checkers_for_optimization.append(item)

    for item in temp_copy_sa0:
        if item not in selected_checkers_sa0:
            if sum(temp_copy_sa0[item])>0:
                if item not in checkers_for_optimization:
                    checkers_for_optimization.append(item)


    print "-----------------"
    for checker in sorted(temp_copy_sa0.keys()):
        print checker,
        for item in temp_copy_sa0[checker]:
            print item,
        print ""
    print "-----------------"
    for checker in sorted(temp_copy_sa1.keys()):
        print checker,
        for item in temp_copy_sa1[checker]:
            print item,
        print ""

    final_selected_list = copy.deepcopy(selected_checkers_sa0)
    for item in selected_checkers_sa1:
        if item not in selected_checkers_sa1:
            final_selected_list.append(item)

    print "selected single dominant checkers:", final_selected_list
    print "selected checkers for optimization:", checkers_for_optimization
    return final_selected_list, checkers_for_optimization