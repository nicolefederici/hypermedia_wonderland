class User <ActiveRecord::Base
  has_and_belongs_to_many :projects 
  has_many :likes
  has_many :newchunks


  has_secure_password

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find {|user| user.slug == slug}
  end
end