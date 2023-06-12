class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }
  validate :start_end_check
 
  def start_end_check
    if start_date.nil? || end_date.nil?
      return
    end
    if self.end_date < self.start_date
      errors.add(:end_date, "は開始日より前の日付は登録できません。") 
    end
  end
end
