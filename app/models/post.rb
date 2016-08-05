class Post < ApplicationRecord

  validates :message, presence: true, length: { maximum: 140 }
  validates :end_time, presence: true

  validate :end_time_before_now?

  def end_time_before_now?
    if end_time && end_time < start_time
      errors.add :end_date, "must be after now"
    end
  end


end
