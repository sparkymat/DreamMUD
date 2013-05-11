
dream_mud_path = File.expand_path('../../lib', __FILE__)
$:.unshift(dream_mud_path)
require 'fileutils'
require 'dream_mud/utils'

module DreamMUD
class ProjectCreator
  attr_reader :path

  def initialize(path)
    @path = path
    @project_name = @path.camelcase
  end

  def setup
    setup_folders
    copy_core
    create_config
  end

  def setup_folders
    FileUtils.mkdir_p("#{@path}/core")
    FileUtils.mkdir_p("#{@path}/classes")
    FileUtils.mkdir_p("#{@path}/races")
    FileUtils.mkdir_p("#{@path}/skills")
    FileUtils.mkdir_p("#{@path}/db/migrate")
    FileUtils.mkdir_p("#{@path}/config")
  end

  def copy_core
    FileUtils.cp_r( Dir.glob("#{File.dirname(__FILE__)}/core/*.rb"), "#{@path}/core/" ) 
  end

  def create_config
    File.open( "#{@path}/config.run", "w+") do |fp|
      fp.write("#This file is used by 'mud server' to launch the mud server\n")
      fp.write("\n")
      fp.write("require ::File.expand_path('../config/application', __FILE__)\n")
      fp.write("run #{@project_name}::Application\n")
      fp.write("\n")
    end
  end
end
end
