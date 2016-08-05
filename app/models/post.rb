class Post < ApplicationRecord
  validates :message, presence: true, length: { maximum: 140 }
  validates :end_time, presence: true

end
