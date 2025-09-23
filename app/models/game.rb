class Game < ApplicationRecord
  belongs_to :user
  enum status: { backlog: 0, playing: 1, completed: 2, wishlist: 3 }
  validates :title, :status, :platform, presence: true
end
