
dream_mud_path = File.expand_path('../../lib', __FILE__)
$:.unshift(dream_mud_path)
require 'fileutils'
require 'dream_mud/utils'
require 'dream_mud/version'

module DreamMUD
class ProjectCreator
  attr_reader :path

  def initialize(path)
    @path = path
    @project_name = @path.camelcase
  end

  def setup
    setup_folders
    copy_core_files
    create_config
    create_app_file
  end

  def setup_folders
    FileUtils.mkdir_p("#{@path}/core")
    FileUtils.mkdir_p("#{@path}/classes")
    FileUtils.mkdir_p("#{@path}/races")
    FileUtils.mkdir_p("#{@path}/skills")
    FileUtils.mkdir_p("#{@path}/db/migrate")
    FileUtils.mkdir_p("#{@path}/config")
  end

  def copy_core_files
    FileUtils.cp_r( Dir.glob("#{File.dirname(__FILE__)}/core/*.rb"), "#{@path}/core/" ) 
    FileUtils.cp_r( "#{File.dirname(__FILE__)}/mud.rb", "#{@path}/" )
  end

  def create_config
    File.open("#{@path}/Gemfile", "w+") do |fp|
      fp.write("source 'https://rubygems.org'\n")
      fp.write("\n")
      fp.write("gem 'dream_mud', '#{DreamMUD::VERSION}'\n")
      fp.write("gem 'eventmachine'\n")
      fp.write("\n")
    end
  end

  def create_app_file
    File.open("#{@path}/run.rb","w+") do |fp|
      fp.write("#!/usr/bin/env ruby\n")
      fp.write("\n")
      fp.write("require './mud.rb'\n")
    end
  end
end
end
