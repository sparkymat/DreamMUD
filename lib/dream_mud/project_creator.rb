require 'fileutils'

class DreamMUD::ProjectCreator
  attr_reader :path

  def initialize(path)
    self.path = path
  end

  def setup_folders
    FileUtils.mkdir_p("#{path}/core")
    FileUtils.mkdir_p("#{path}/classes")
    FileUtils.mkdir_p("#{path}/races")
    FileUtils.mkdir_p("#{path}/skills")
  end
end
