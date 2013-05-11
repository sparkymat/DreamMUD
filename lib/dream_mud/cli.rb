require './project_creator'

Signal.trap("INT") { puts; exit(1) }

def show_help
  puts "Usage:
  mud new MUD_PATH [options]  # Create new mud installation at give MUD_PATH
  mud g(enerate) race Human # Generate a new race with given name
  mud g(enerate) class Warlock # Generate a new class with given name
  "
end

if ARGV.count == 0
  show_help
else
  case ARGV[0]
  when "h", "help"
    show_help
  when "new"
    if ARGV[1].nil? || ARGV[1] == ""
      show_help
    else
      creator = DreamMUD::ProjectCreator.new(ARGV[1])
      creator.setup_folders
    end
  end
end
