# Credits:
# - http://github.com/ryanb/dotfiles/blob/master/irbrc
# - http://github.com/logankoester/irbrc/blob/master/irbrc
# - http://github.com/greatseth/dotfiles/blob/master/irbrc

require 'irb/completion'
require 'irb/ext/save-history'
require 'wirble'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true


%w[rubygems looksee/shortcuts utility_belt ap wirble].each do |gem|
  begin
    require gem
  rescue LoadError
  end
end

Wirble.init

class Object
  def my_methods
    (methods - Object.public_instance_methods).sort
  end

  # http://moonbase.rydia.net/mental/blog/programming/eavesdropping-on-expressions
  def tap
    yield self
    self
  end
end


