class Project <ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :oldchunks

  def pslug
    title.downcase.gsub(" ", "-")
  end

  def self.find_by_pslug(pslug)
    Project.all.find {|project| project.pslug == pslug}
  end

 
end