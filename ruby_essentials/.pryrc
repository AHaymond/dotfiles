# ------------------------------------------------------------------------------
# #          FILE:  .pryrc
# #   DESCRIPTION:  IRB configuration file
# #        AUTHOR:  Adam Haymond
# #       VERSION:  1.0.0
# # ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# General
# ------------------------------------------------------------------------------
Pry.editor = ENV['EDITOR'] || 'vim'

# Load the Rails configuration if Pry is running as a rails console.
#load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------
# Show the Ruby version (useful for RVM).
Pry.config.prompt = Pry::Prompt.new(
  "custom",
  "my custom prompt",
  [proc { |obj, nest_level, _| "#{RUBY_VERSION} | #{obj}:#{nest_level} > " }]
)

Pry.config.commands.command 'pbcopy', 'Copy input to clipboard' do |input|
  input = input ? target.eval(input) : pry_instance.last_result
  IO.popen('pbcopy', 'w') { |io| io << input }
end

Pry.config.commands.command 'html-view', 'Write input to and html file and open it' do |input, suffix|
  input = input ? target.eval(input) : pry_instance.last_result
  suffix = suffix ? suffix : '.json'

  require 'tempfile'
  file = Tempfile.new(['pry-result', suffix])
  #begin
    file.write input
    file.rewind
    `open #{file.path}`
  #ensure
  #  file.unlink
  #end
end

# Print out first 10 lines of an exception
#Pry.config.exception_handler = proc do |output, exception, _pry_|
#  output.puts "#{exception}"
#  exception.backtrace.first(10).each { |e| output.puts e }
#end

# Custom prompt
#prompt = defined?(Rails) ? Rails.application.class.parent_name : File.basename(Dir.pwd)
#Pry.config.prompt = [
#  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} > " },
#  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} *"}
#]

# Default Command Set, add custom methods here:
#default_command_set = Pry::CommandSet.new do
#  command 'copy', 'Copy to clipboard' do |str|
#    str = "#{_pry_.input_array[-1]}#=> #{_pry_.last_result}\n" unless str
#    IO.popen('pbcopy', 'r+') { |io| io.puts str }
#    output.puts "-- Copy to clipboard --\n#{str}"
#  end
#end

# https://github.com/kyrylo/pry-theme
# $ gem install pry-theme
# $ pry
# $ pry-theme install tomorrow-night
 Pry.config.theme = 'tomorrow-night'

# Set awesome_print as the default formatter
# https://github.com/michaeldv/awesome_print/
# $ gem install awesome_print
#begin
  # add awesome_print to LOAD_PATH just in case it is not reuquired in a Gemfile
  #$LOAD_PATH << %x(find $HOME/.rvm/gems/$RUBY_VERSION/gems -maxdepth 1 -type d -name 'awesome*' | tail -n1).gsub("\n",'') + '/lib'
#	require 'awesome_print'
#	Pry.config.print = proc { |output, value| output.puts value.ai(indent: 2) }
#rescue LoadError => e
#	warn "[WARN] #{e}"
#	puts '$ gem install awesome_print'
#end

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
#rails = File.join Dir.getwd, 'config', 'environment.rb'
#
#if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
#  require rails
#
#  Pry.commands.alias_command '@', 'show-model'
#
#  if Rails.version[0..0] == "2"
#    require 'console_app'
#    require 'console_with_helpers'
#  elsif Rails.version[0..0].match(/(3|4)/).present?
#    require 'rails/console/app'
#    require 'rails/console/helpers'
#    extend Rails::ConsoleMethods
#  else
#    warn "[WARN] cannot load Rails console commands (Rails Version > 2?)"
#  end
#end

#Pry.config.hooks.add_hook(:when_started, :say_hi) { puts "\n\nWelcome to Pry!\n\n" }
# Pry.config.hooks.add_hook(:after_session, :say_bye) { puts "\nHave a nice day! :)\n\n"}

#Pry.config.commands.import(default_command_set)

#Pry.commands.block_command(/!(\d+)/, "Replay a line of history", :listing => "!hist") do |line|
#  run "history --replay #{line}"
#end
