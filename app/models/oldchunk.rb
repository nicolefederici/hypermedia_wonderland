class Oldchunk <ActiveRecord::Base
  belongs_to :project
  has_many :newchunks

  def oslug
    title.strip.downcase.gsub(/(&|&amp;)/, ' and ').gsub(/[\s\.\/\\]/, '-').gsub(/[^\w-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
  end

  def self.find_by_oslug(oslug)
    Oldchunk.all.find {|oldchunk| oldchunk.oslug == oslug}
  end
  
end