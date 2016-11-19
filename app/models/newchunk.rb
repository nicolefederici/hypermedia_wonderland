class Newchunk <ActiveRecord::Base
  belongs_to :user
  belongs_to :oldchunk
  has_many :likes

  
end