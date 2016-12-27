class User <ActiveRecord::Base
  has_and_belongs_to_many :projects 
  has_many :likes #these are the likes that a user has deployed, rather than those that the user has gathered themselves.
  has_many :newchunks
  # I'm not positive, but I think I should have written that a User has_many :comments. I'm actually not sure what that would achieve for me in this but it seems true, and so why isn't it there? I may have to add it in later. I mean, the program is working without it, which goes to the fact that I think these relationships tend to be overwritten. Maybe because I didn't do full CRUD on the comments. (users can't edit comments, but they can delete them and it works, so that is strange...)


  has_secure_password #bcrypt method- to encrypt pass. through salting and hashing as soon as it gets saved to the database. (so, not "in the clear" which would be unsafe)

  def slug #when I use this method for slugging users' names in more routes that offer users more functionality, I won't use "title" I will use username.whatever...so this is kind of an armiture for something I'm about to build next. 
    title.strip.downcase.gsub(/(&|&amp;)/, ' and ').gsub(/[\s\.\/\\]/, '-').gsub(/[^\w-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
  end
#this too, actually
  def self.find_by_slug(slug)
    User.all.find {|user| user.slug == slug}
  end
end