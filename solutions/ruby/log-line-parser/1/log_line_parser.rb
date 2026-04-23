class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    splited_line = @line.split(']:').last
    splited_line.strip
  end

  def log_level
    log_level_str = @line.split(']:').first
    log_level_str.gsub("[", "").downcase
  end

  def reformat
    "#{message} (#{log_level})" 
  end
end
