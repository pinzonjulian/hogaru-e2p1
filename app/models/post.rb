class Post < ApplicationRecord
  def end_time_before_now?
    if end_time < DateTime.now
      errors.add :end_date, "must be after now"
    end
  end

  validates :message, presence: true, length: { maximum: 140 }
  validates :end_time, presence: true

  validate :end_time_before_now?



end
