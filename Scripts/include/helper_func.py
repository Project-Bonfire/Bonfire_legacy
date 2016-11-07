import os

'''
Print a colored message
'''

#Check_dir return values
CHECK_DIR_ERROR = -1
DIR_EXISTS = 0
DIR_NOT_EXISTS = 1

# Message types
MSG_INFO = 0
MSG_WARN = 1
MSG_ERROR = 2
MSG_BLUE_INFO = 3
MSG_DEBUG = 4

# Color definitions
HEADER = '\033[95m'
OKBLUE = '\033[94m'
OKGREEN = '\033[92m'
WARNING = '\033[93m'
FAIL = '\033[91m'
ENDC = '\033[0m'
BOLD = '\033[1m'
UNDERLINE = '\033[4m'


def print_msg(message_severity, message_content):
    '''
    Prints a message with specified severity

    message_severity: string - is message info/warning/error. Uses types specified above
    message_content: string

    Return: none
    '''

    if message_severity == MSG_INFO:
        print BOLD + "INFO: " + ENDC + message_content

    if message_severity == MSG_WARN:
        print BOLD + WARNING + "WARNING: " + ENDC + message_content

    if message_severity == MSG_ERROR:
        print BOLD + FAIL + "ERROR: " + ENDC + message_content

    if message_severity == MSG_BLUE_INFO:
        print OKBLUE + "INFO: " + ENDC + message_content

    if message_severity == MSG_DEBUG:
        print BOLD + "DEBUG: " + ENDC + message_content



def check_dir(dir_path, create_dir_en):
    """
    Check if directory exists. Optionally create it if not.

    dir_path: string      - path of the directory
    create_dir_en: bool   - whether to create the directory if it does not exist yet

    return: int -       -1 in case of error, positive value othervise
    """

    # Check for the existance of the sources directory
    if os.path.exists(dir_path):

        # Path exists, but is not a file
        if not os.path.isdir(dir_path):
            print_msg(MSG_WARN, "Directory '" + dir_path \
                                    + "' already exists, but it's not a directory.\n"
                                    + "To continue, you will need to remove it.")


            input_ok = False
            user_input = raw_input("Do you want to remove it now? y/n\n")

            while input_ok == False:
                if user_input == "y" or user_input == "n":
                    input_ok = True
                else:
                    user_input = raw_input("Invalid input. y/n: ")
                    input_ok = False

            # Remove the existing file
            if user_input == "y":
                print_msg(MSG_INFO, "Removing existing file...")
                try:
                    os.remove(dir_path)
                except OSError as e:
                    print_msg(MSG_ERROR, "Error " + str(e[0]) + ": " + e[1])
                    return CHECK_DIR_ERROR

            elif user_input == "n":
                print_msg(MSG_ERROR, "Cancelled by user")
                return CHECK_DIR_ERROR

            #Create a directory in place of the file
            if create_dir_en:
                print_msg(MSG_BLUE_INFO, "Creating the directory")
                try:
                    os.makedirs(dir_path)
                except OSError as e:
                    print_msg(MSG_ERROR, "Error " + str(e[0]) + ": " + e[1])
                    return CHECK_DIR_ERROR

                return DIR_EXISTS

            else:
                return DIR_NOT_EXISTS

        # Directory already exists
        else:
            print_msg(MSG_BLUE_INFO, "Using existing directory")
            return DIR_EXISTS
    else:
        if create_dir_en:
            print_msg(MSG_BLUE_INFO, "Directory not found. Creating a new one.")
            try:
                os.makedirs(dir_path)
            except OSError as e:
                print_msg(MSG_ERROR, "Error " + str(e[0]) + ": " + e[1])
                return CHECK_DIR_ERROR

            return DIR_EXISTS
        else:
            return DIR_NOT_EXISTS
