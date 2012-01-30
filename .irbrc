# Credits:
# - http://github.com/ryanb/dotfiles/blob/master/irbrc
# - http://github.com/logankoester/irbrc/blob/master/irbrc
# - http://github.com/greatseth/dotfiles/blob/master/irbrc

$: << "/Users/mthorley/.rvm/gems/ruby-1.8.7-p334/gems/"

Dir.glob(File.expand_path(File.dirname __FILE__) + "/.gem/gems/*").each {|p| $: << p}

require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'
require 'wirble'
require 'utility_belt'
require 'ap'
require 'looksee'
require 'interactive_editor'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

Wirble.init
Wirble.colorize

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
