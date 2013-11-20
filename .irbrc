## .irbrc

require "rubygems"

## tab-tab completion, colorizing
begin

  # load wirble
  require 'wirble'

  def set_wirble_color
    # start wirble (with color)
    Wirble.init
    Wirble.colorize

    colors = Wirble::Colorize.colors.merge({
      :object_class   => :purple,
      :symbol         => :purple,
      :symbol_prefix  => :purple
    })
    Wirble::Colorize.colors = colors
    rescue LoadError => err
      warn "Couldn't load Wirble: #{err}"
  end
end

## so you can run pretty print
# require 'pp'

## auto indent
IRB.conf[:AUTO_INDENT]=true

## Set prompt to default instead of RVM
#IRB.conf[:PROMPT_MODE] = :DEFAULT

# Set prompt to app/environment name
if defined? Rails.env
  rails_env = Rails.env.downcase[0,3]
  current_app = Dir.pwd.split('/').last
  IRB.conf[:PROMPT].reverse_merge!( RAILS_ENV: { PROMPT_I: "#{current_app} #{rails_env} >> ",
                                                 PROMPT_N: "#{current_app} #{rails_env} >> ",
                                                 PROMPT_S: nil,
                                                 PROMPT_C: "#{current_app} #{rails_env} ?> ",
                                                 RETURN: "=> %s\n" })
  IRB.conf[:PROMPT_MODE] = :RAILS_ENV
end

require "awesome_print"
def no_ap # Switch awesome_print off
  IRB::Irb.class_eval do
    def output_value
      printf @context.return_format, @context.inspect_last_value
    end
  end

  set_wirble_color
  puts 'awesome_print: OFF'.red
  puts 'wirble colors: ON'.green
end

def yes_ap # Switch awesome_print on
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value, raw: true
    end
  end
  puts 'awesome_print: ON'.green
  puts 'wirble colors: OFF'
end

def flush
  Dbug.flush 300
  puts "Flushed"
end

def flush_d
	Dbug.flush_d 300
	puts 'Flushed development log'
end

# Use awesome_print as the default IRB, Rails C formatter
# must be at the end of the file to take effect when IRB or Rails C is loaded
unless IRB.version.include?('DietRB')
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
  puts "awesome_print: ON".green
else
  IRB.formatter = Class.new(IRB::Formatter) do
    def inspect_object(object)
      object.ai
    end
  end.new
end
