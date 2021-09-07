class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :trackable
  include DeviseTokenAuth::Concerns::User

  has_many :events, dependent: :destroy
  has_many :active_relationships, class_name: "EventLink", foreign_key: "user_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :event
  before_save :downcase_email

  validates :name, presence: true, length: { maximum: 50 }

  # Copied from rails book should work for general emails
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,   presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  # Follows an event
  def follow_event(event)
    following << event # unless self.id == event.creator
  end

  # Unfollows an event
  def unfollow_event(event)
    following.delete(event)
  end

  # Returns true if following given event
  def following?(event)
    following.include?(event)
  end

  private

  # Converts email to all lowercase
  def downcase_email
    self.email.downcase!
  end
end
