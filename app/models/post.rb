class Post < ActiveRecord::Base
  has_many :segments
  has_many :likes
  
  def self.ordered_published_posts
    Post.where(published: true).sort_by(&:updated_at).reverse
  end
end
