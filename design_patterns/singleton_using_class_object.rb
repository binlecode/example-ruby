# in ruby a class is a regular object too
# so it can be used as the ideal context holder for singleton

class MyLogger
  DEBUG, INFO, WARN, ERROR = 2, 4, 6, 8
  ALLOWED_LEVELS = [DEBUG, INFO, WARN, ERROR]

  @@logger
  @@level = DEBUG

  def self.log(level, message)
    raise 'invalid log level' unless ALLOWED_LEVELS.include? level
    if level >= @@level
      @@logger ||= $stdout # lazy instantiation of the logger singleton subject
      @@logger.puts message
    end
  end

  def self.level=(level)
    raise 'invalid log level' unless ALLOWED_LEVELS.include? level
    @@level = level
  end

  def self.level
    @@level
  end

  private_class_method :new # disable instance construction
end


MyLogger.level = MyLogger::INFO
MyLogger.log MyLogger::WARN, 'this is a warning message'
MyLogger.log MyLogger::DEBUG, 'this is a debug message'
MyLogger.log MyLogger::ERROR, 'this is an error message'

begin
  logger = MyLogger.new # this will raise NoMethod exception
rescue Exception => exp
  puts exp.inspect
end

# now we do some enhancement to provide a convenient set of apis
class MyLogger
  ALLOWED_LOG_LEVELS = {:debug => DEBUG, :info => INFO, :warn => WARN, :error => ERROR}

  def self.method_missing(method_name, *args)
    log(log_level(method_name), *args)
  end

  def self.log_level(level_name)
    ALLOWED_LOG_LEVELS[level_name.downcase.to_sym]
  end

end

MyLogger.debug 'this is a debug msg'
MyLogger.info 'this is an info msg'
MyLogger.warn 'this is a warn msg'
MyLogger.error 'this is an error msg'

puts MyLogger.level

begin
  MyLogger.bad_level 'this is a msg with bad log level'
rescue Exception => exp
  puts exp.inspect # getting a RuntimeError raised by MyLogger::log method
end











