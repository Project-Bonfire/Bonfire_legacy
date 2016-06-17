# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file
import copy


def extract_checker_info(name_string):
    package_file.list_of_detection_info_sa0[name_string] = []
    package_file.list_of_detection_info_sa1[name_string] = []

    package_file.list_of_true_misses_sa0[name_string] = []
    package_file.list_of_true_misses_sa1[name_string] = []
    area_report_file = open("coverage_results/fstat"+str(name_string), 'r')
    line = area_report_file.readline()
    while line != "":
        line = area_report_file.readline()
        if ".CHECKERS DETECTION INFO - amount of detections" in line:
            line = area_report_file.readline()
            for item in line.split(" "):
                if "|" in item:
                    package_file.list_of_detection_info_sa0[name_string].append(item.split("|")[0])
                    package_file.list_of_detection_info_sa1[name_string].append(item.split("|")[1])
        if "amount of True Misses" in line:
            line = area_report_file.readline()
            for item in line.split(" "):
                if "|" in item:
                    package_file.list_of_true_misses_sa0[name_string].append(item.split("|")[0])
                    package_file.list_of_true_misses_sa1[name_string].append(item.split("|")[1])
    print package_file.list_of_detection_info_sa0
    print package_file.list_of_detection_info_sa1
    return None


def find_essential_checker():
    temp_copy_sa0 = copy.deepcopy(package_file.list_of_true_misses_sa0)
    temp_copy_sa1 = copy.deepcopy(package_file.list_of_true_misses_sa1)

    random_item = temp_copy_sa0.keys()[0]

    selected_checkers_sa0 = []
    selected_checkers_sa1 = []
    checkers_for_optimization = []

    for node in range(0, len(temp_copy_sa0[random_item])):
        best_checker = None
        best_true_miss_rate = float('inf')
        for checker in temp_copy_sa0:
            true_miss_rate = int(temp_copy_sa0[checker][node])
            if true_miss_rate >= 0:
                if true_miss_rate < best_true_miss_rate:
                    best_true_miss_rate = true_miss_rate
                    best_checker = checker

        # if best_true_miss_rate == 0:
        count = 0
        for checker in temp_copy_sa0:
            if int(package_file.list_of_true_misses_sa0[checker][node]) == best_true_miss_rate:
                if int(package_file.list_of_detection_info_sa0[str(checker)][node]) > 0:
                    temp_copy_sa0[checker][node] = 1
                    count += 1
            else:
                temp_copy_sa0[checker][node] = 0
        if count == 1:
            if best_checker not in selected_checkers_sa0:
                selected_checkers_sa0.append(best_checker)
        # else:
        #    for checker in temp_copy_sa0:
        #        temp_copy_sa0[checker][node] = 0

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
        # if best_true_miss_rate == 0:
        count = 0
        for checker in temp_copy_sa1:
            if int(package_file.list_of_true_misses_sa1[checker][node]) == best_true_miss_rate:
                if int(package_file.list_of_detection_info_sa1[str(checker)][node]) > 0:
                    temp_copy_sa1[checker][node] = 1
                    count += 1
            else:
                temp_copy_sa1[checker][node] = 0
        if count == 1:
            if best_checker not in selected_checkers_sa1:
                selected_checkers_sa1.append(best_checker)
        # else:
        #    for checker in temp_copy_sa1:
        #        temp_copy_sa1[checker][node] = 0

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

    if package_file.debug:
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
        print "-----------------"

    final_selected_list = []
    for item in selected_checkers_sa0:
        final_selected_list.append(str(item))
    for item in selected_checkers_sa1:
        if item not in selected_checkers_sa1:
            final_selected_list.append(str(item))

    for item in temp_copy_sa0.keys():
        if str(item) not in final_selected_list:
            if str(item) not in checkers_for_optimization:
                checkers_for_optimization.append(str(item))

    print "selected single dominant checkers:", final_selected_list
    print "selected checkers for optimization:", checkers_for_optimization
    return final_selected_list, checkers_for_optimization
