require 'rubygems'
require 'highline'

class Matrimony
  def self.run(args)
    new.run(*args)
  end
  
  def initialize
    @io = HighLine.new($stdin, $stdout)
  end
  
  def run(*args)
    say "This is your first run"
    exit
  end
  
  private
  
  def exit(status = 0)
    Kernel.exit(status)
  end
  
  %w(agree ask choose color list say).each do |method|
    class_eval %(
      def #{method} *args
        @io.#{method} *args
      end
    )
  end
end