class Group < ApplicationRecord
  belong_to :user
  validates :title, presence: true
end
