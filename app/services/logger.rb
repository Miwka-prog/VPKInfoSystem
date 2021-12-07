# rubocop:disable Style/ClassVars
class Logger
  def initialize
    @log = File.open('log.txt', 'a')
  end

  @@instance = Logger.new

  def self.instance
    @@instance
  end

  def log(msg)
    @log.syswrite("#{msg}\n")
  end

  private_class_method :new
end
# rubocop:enable Style/ClassVars
