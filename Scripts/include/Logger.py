import sys
import os
import time
from Scripts.include.package import LOG_DIR



class Logger(object):
    """
    This Class is for redirecting the console messages to a log file...
    """
    def __init__(self):
        self.terminal = sys.stdout
        self.log = open(LOG_DIR+'/Console_log_'+str(time.time())+'.log', "a")

    def write(self, message):
        self.terminal.write(message)
        self.log.write(message)

    def flush(self):
        pass