# Credits:
# - http://github.com/ryanb/dotfiles/blob/master/irbrc
# - http://github.com/logankoester/irbrc/blob/master/irbrc
# - http://github.com/greatseth/dotfiles/blob/master/irbrc
require 'rubygems'
require 'interactive_editor'
require 'irb/completion'
require 'irb/ext/save-history' rescue nil
require 'ap'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

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

def dir(obj)
  (obj.methods - Object.public_instance_methods).sort
end

begin
    require "pry"
      Pry.start
        exit
rescue LoadError => e
    warn "=> Unable to load pry"
end
