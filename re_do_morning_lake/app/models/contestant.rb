class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects
  validates_presence_of :name, :age, :hometown, :years_of_experience

  def project_list
    all_projects = self.projects.map do |project|
      project.name
    end
    "Projects: #{all_projects.join(", ")}"
  end
  
end
