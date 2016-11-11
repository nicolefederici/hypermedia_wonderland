class OldChunk <ActiveRecord::Base
  belongs_to :project
  has_many :newchunks

  
end