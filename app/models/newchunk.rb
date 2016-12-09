class Newchunk <ActiveRecord::Base
  belongs_to :user
  belongs_to :oldchunk
  has_many :likes
  has_many :comments
  
end