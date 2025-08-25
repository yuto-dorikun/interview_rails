class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :interviewee, class_name: "User"

  enum category: {
    career_consultation: 0,
    performance_review: 1,
    project_discussion: 2,
    feedback_session: 3,
    one_on_one: 4,
    goal_setting: 5
  }

  validates :title, presence: true, length: { maximum: 255 }
  validates :scheduled_at, presence: true
  validates :location, length: { maximum: 255 }, allow_blank: true
  validates :category, presence: true, inclusion: { in: categories.keys }
  validates :user_id, presence: true
  validates :interviewee_id, presence: true
  validates :scheduled_at_must_be_in_the_future, on: :create
  validates :user_and_interviewee_cannot_be_the_same

  def category_name
    I18n.
  end

  def scheduled_at_must_be_in_the_future
    if scheduled_at.present? && scheduled_at < Time.current
      errors.add(:scheduled_at, "must be in the future")
    end
  end

  def user_and_interviewee_cannot_be_the_same
    if user_id == interviewee_id
      errors.add(:interviewee, "cannot be the same as the interviewer")
    end
  end
end
