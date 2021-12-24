class User < ApplicationRecord
  has_many :labs

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
