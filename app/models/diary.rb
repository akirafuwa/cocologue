class Diary < ApplicationRecord
  include DateCalculator
  belongs_to :user
  validates :content, presence: true, length: { maximum: 2000 }
end
