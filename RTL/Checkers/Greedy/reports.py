# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file


def report_detection_tables():
    if package_file.debug:
        print "------------------------------"
        print "printing the checkers detection dictionaries"
        print "stuck at 0:"
        print package_file.list_of_detection_info_sa0
        print "------------------------------"
        print "printing the checkers detection dictionaries"
        print "stuck at 1:"
        print package_file.list_of_detection_info_sa1

        print "------------------------------"
        print "printing the checkers detection tables"
        print "stuck at 0:"
        print package_file.list_of_detection_info_sa0
        for item in package_file.list_of_detection_info_sa0:
            print item,
            for node in range(0, len(package_file.list_of_detection_info_sa0[item])):
                print package_file.list_of_detection_info_sa0[item][node],
            print ""

        print "------------------------------"
        print "printing the checkers detection tables"
        print "stuck at 1:"
        print package_file.list_of_detection_info_sa1
        for item in package_file.list_of_detection_info_sa1:
            print item,
            for node in range(0, len(package_file.list_of_detection_info_sa1[item])):
                print package_file.list_of_detection_info_sa1[item][node],
            print ""

        print "------------------------------"
        print "printing the checkers true misses tables"
        print "stuck at 0:"
        for item in package_file.list_of_true_misses_sa0:
            print item,
            for node in range(0, len(package_file.list_of_true_misses_sa0[item])):
                if int(package_file.list_of_detection_info_sa0[str(item)][node]) == 0:
                    print "ND",
                else:
                    print package_file.list_of_true_misses_sa0[item][node],
            print ""

        print "------------------------------"
        print "printing the checkers true misses tables"
        print "stuck at 1:"
        for item in package_file.list_of_true_misses_sa1:
            print item,
            for node in range(0, len(package_file.list_of_true_misses_sa1[item])):
                if int(package_file.list_of_detection_info_sa1[str(item)][node]) == 0:
                    print "ND",
                else:
                    print package_file.list_of_true_misses_sa1[item][node],
            print ""
        print "------------------------------"


def report_config():
    print "      Config File Report"
    print "------------------------------"
    print "Unit Under Test:", package_file.unit_under_test
    print "number of checkers:", package_file.number_of_checkers
    print "size max:", package_file.size_max
    print "selection function:", package_file.cost_function_type
    print "essential checker extraction:", package_file.extract_essential_checkers
    if package_file.test_mode:
        print "test mode: \033[91m ON\033[0m"
    else:
        print "test mode: \033[32m OFF\033[0m"
    print "---------------------------------"
