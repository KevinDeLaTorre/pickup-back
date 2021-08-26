class User < ApplicationRecord
  before_save :downcase_email

  validates :name, presence: true, length: { maximum: 50 }

  # Copied from rails book should work for general emails
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,   presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true


  private

  # Converts email to all lowercase
  def downcase_email
    self.email.downcase!
  end
end
