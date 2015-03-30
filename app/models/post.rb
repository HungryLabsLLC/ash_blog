class Post < ActiveRecord::Base
  has_many :segments
  has_many :likes
  
end
