class Project <ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :oldchunks

  def pslug
    title.strip.downcase.gsub(/(&|&amp;)/, ' and ').gsub(/[\s\.\/\\]/, '-').gsub(/[^\w-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
  end

  def self.find_by_pslug(pslug)
    Project.all.find {|project| project.pslug == pslug}
  end

 
end