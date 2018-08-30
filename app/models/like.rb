# frozen_string_literal: true

# Model for feature/like_dislike
class Like < ApplicationRecord
  belongs_to  :post
  belongs_to  :user
end
