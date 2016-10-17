
import sys
import os
import time
import package_file


class Logger(object):
    """
    This Class is for redirecting the console messages to a log file...
    """
    def __init__(self):
        log_directory = package_file.log_folder
        if not os.path.isdir(log_directory):
            os.makedirs(log_directory)
        self.terminal = sys.stdout
        self.log = open(os.path.join(os.path.join(os.path.curdir, log_directory),
                        'Console_log_'+str(time.time())+'.log'), "a")

    def write(self, message):
        self.terminal.write(message)
        self.log.write(message)

    def flush(self):
        pass