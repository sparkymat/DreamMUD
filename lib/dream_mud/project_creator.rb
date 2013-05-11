require 'fileutils'

module DreamMUD
class ProjectCreator
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def setup
    setup_folders
    copy_core
  end

  def setup_folders
    FileUtils.mkdir_p("#{@path}/core")
    FileUtils.mkdir_p("#{@path}/classes")
    FileUtils.mkdir_p("#{@path}/races")
    FileUtils.mkdir_p("#{@path}/skills")
  end

  def copy_core
    FileUtils.cp_r( "./core/.", "#{@path}/core/" ) 
  end
end
end
