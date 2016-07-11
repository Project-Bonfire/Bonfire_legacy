__author__ = 'siavoosh'
import package_file
import copy


def find_dominant_true_detect_checker():
    print "------------------------------------------------------------------------------------------------"
    print "                     Extracting dominant true detection checkers"
    print "------------------------------------------------------------------------------------------------"
    temp_copy_sa0 = copy.deepcopy(package_file.list_of_detection_info_sa0)
    temp_copy_sa1 = copy.deepcopy(package_file.list_of_detection_info_sa1)

    random_item = temp_copy_sa0.keys()[0]

    selected_checkers_sa0 = []
    selected_checkers_sa1 = []
    checkers_for_optimization = []

    for node in range(0, len(temp_copy_sa0[random_item])):
        best_checker = None
        best_true_detect_rate = 0
        for checker in temp_copy_sa0:
            true_detect_rate = int(temp_copy_sa0[checker][node])
            if int(package_file.list_of_detection_info_sa0[str(checker)][node]) > 0:
                if true_detect_rate >= 0:
                    if true_detect_rate > best_true_detect_rate:
                        best_true_detect_rate = true_detect_rate
                        best_checker = checker

        count = 0
        for checker in temp_copy_sa0:
            if best_true_detect_rate > 0:
                if int(package_file.list_of_detection_info_sa0[checker][node]) == best_true_detect_rate:
                    temp_copy_sa0[checker][node] = 1
                    count += 1
                else:
                    temp_copy_sa0[checker][node] = 0
            else:
                temp_copy_sa0[checker][node] = 0
        if count == 1:
            if best_checker not in selected_checkers_sa0:
                selected_checkers_sa0.append(best_checker)
                # else:
                #    for checker in temp_copy_sa0:
                #        temp_copy_sa0[checker][node] = 0

    print "single dominant true detect checkers for sta0:", selected_checkers_sa0

    for node in range(0, len(temp_copy_sa1[random_item])):
        best_checker = None
        best_true_detect_rate = 0
        for checker in temp_copy_sa1:
            true_detect_rate = int(temp_copy_sa1[checker][node])
            if int(package_file.list_of_detection_info_sa1[str(checker)][node]) > 0:
                if true_detect_rate >= 0:
                    if true_detect_rate > best_true_detect_rate:
                        best_true_detect_rate = true_detect_rate
                        best_checker = checker

        count = 0
        for checker in temp_copy_sa1:
            if best_true_detect_rate > 0:
                if int(package_file.list_of_detection_info_sa1[checker][node]) == best_true_detect_rate:
                    temp_copy_sa1[checker][node] = 1
                    count += 1
                else:
                    temp_copy_sa1[checker][node] = 0
            else:
                temp_copy_sa1[checker][node] = 0
        if count == 1:
            if best_checker not in selected_checkers_sa1:
                selected_checkers_sa1.append(best_checker)

    print "single dominant true detect checkers for sta1:", selected_checkers_sa1
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
        print "printing the checkers true detect table (0-1)"
        print "stuck at 0:"
        for checker in sorted(temp_copy_sa0.keys()):
            print checker,
            for item in temp_copy_sa0[checker]:
                print item,
            print ""

        print "-----------------"
        print "printing the checkers true detect table (0-1)"
        print "stuck at 1:"
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
        if item not in selected_checkers_sa0:
            final_selected_list.append(str(item))

    for item in temp_copy_sa0.keys():
        if str(item) not in final_selected_list:
            if str(item) not in checkers_for_optimization:
                checkers_for_optimization.append(str(item))

    print "selected single dominant true detect checkers:", final_selected_list
    return final_selected_list, checkers_for_optimization
