
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
    File.open("#{@path}/Gemfile") do |fp|
      fp.write("source 'https://rubygems.org'\n")
      fp.write("\n")
      fp.write("gem 'dream_mud', '#{DreamMUD::VERSION}'\n\n")
    end

    File.open("#{@path}/config/application.rb", "w+") do |fp|
      fp.write("dream_mud_path = '#{File.expand_path('../../lib',__FILE__)}'\n")
      fp.write("$:.unshift(dream_mud_path\n")
      fp.write("\n")
      fp.write("require 'dream_mud/all'\n")
      fp.write("\n")
      fp.write("if defined?(Bundler)\n")
      fp.write("  Bundler.require\n")
      fp.write("end\n")
      fp.write("\n")
      fp.write("module #{@project_name}\n")
      fp.write("  class Application < DreamMUD::Application\n")
      fp.write("  end\n")
      fp.write("end\n")
      fp.write("\n")
    end
  end
end
end
