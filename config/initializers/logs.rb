custom_logfile = File.open("log/custom_log.log", 'a')
custom_logfile.sync = true
CUSTOM_LOG = CustomLogger.new(custom_logfile)
