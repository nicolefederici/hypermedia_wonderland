class Oldchunk <ActiveRecord::Base
  belongs_to :project
  has_many :newchunks

  def oslug
    title.downcase.gsub(" ", "-")
  end

  def self.find_by_oslug(oslug)
    Oldchunk.all.find {|oldchunk| oldchunk.oslug == oslug}
  end
  
end