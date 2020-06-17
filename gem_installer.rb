#
# a utility script to support gem install programmatically
# instead of using backticks (``), this uses rubygems given Command class
# 

require 'rubygems/commands/install_command'

def find_or_install(gem_name)
    Gem::Specification::find_by_name(gem_name)
rescue Gem::LoadError
    install_gem(gem_name)
end

def install_gem(gem_name)
    cmd = Gem::Commands::InstallCommand.new
    cmd.handle_options [gem_name]     

    cmd.execute
rescue Gem::SystemExitException => e
    puts "FAILURE: #{e.exit_code}"
end

