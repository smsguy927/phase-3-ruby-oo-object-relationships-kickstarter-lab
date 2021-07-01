# frozen_string_literal: true

class Backer
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def back_project(project)
    ProjectBacker.new(project, self)
  end

  def backed_projects
    ProjectBacker.all.select { |proj_back| proj_back.backer == self }.map(&:project)
  end

  def self.all
    @@all
  end
end
