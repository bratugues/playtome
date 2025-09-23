class Game < ApplicationRecord
  belongs_to :user
  validate :title, :status, :platform, presence: true
end
