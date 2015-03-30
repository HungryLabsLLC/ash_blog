class Like < ActiveRecord::Base
  validates :ip_address, uniqueness: true
  belongs_to :post
end
