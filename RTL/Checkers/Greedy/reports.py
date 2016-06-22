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
                print package_file.list_of_true_misses_sa0[item][node],
            print ""

        print "------------------------------"
        print "printing the checkers true misses tables"
        print "stuck at 1:"
        for item in package_file.list_of_true_misses_sa1:
            print item,
            for node in range(0, len(package_file.list_of_true_misses_sa1[item])):
                print package_file.list_of_true_misses_sa1[item][node],
            print ""
        print "------------------------------"