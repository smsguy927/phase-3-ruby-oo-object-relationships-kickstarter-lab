# frozen_string_literal: true

class Project
  attr_reader :title

  @@all = []

  def initialize(title)
    @title = title
    @@all << self
  end

  def add_backer(backer)
    ProjectBacker.new(self, backer)
  end

  def backers
    ProjectBacker.all.select { |proj_back| proj_back.project == self }.map(&:backer)
  end

  def self.all
    @@all
  end
end
