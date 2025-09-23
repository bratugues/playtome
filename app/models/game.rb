class Game < ApplicationRecord
  belongs_to :user
  enum status: { Backlog: 0, Playing: 1, Completed: 2, Wishlist: 3 }
  validates :title, :status, :platform, presence: true
end
