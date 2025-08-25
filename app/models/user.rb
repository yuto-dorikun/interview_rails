class User < ApplicationRecord
    has_many :interviews, dependent: :destroy
    has_many :interview_as_interviewee, class_name: "Interview", foreign_key: "interviewee_id", dependent: :destroy

    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, 
                    length: { maximum: 255 }
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

    before_save :downcase_email

    def display_name
        name.present? ? name : email.split('@').first
    end
end