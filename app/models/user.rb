class User < ApplicationRecord
  acts_as_messageable

  def mailboxer_email(*)
    email
  end

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :subscriptions, dependent: :destroy
  has_many :courses, through: :subscriptions

  validates :first_name, :second_name, presence: true
end
