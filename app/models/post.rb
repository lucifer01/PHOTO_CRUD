class Post < ApplicationRecord
  belongs_to :user
  has_many :pic 
  has_many :comments
end
