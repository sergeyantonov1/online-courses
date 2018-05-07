class Manager < ApplicationRecord

  acts_as_messageable

  def mailboxer_email(messageable)
    email
  end

  devise :invitable, :database_authenticatable, :recoverable,
    :rememberable, :trackable, :registerable, :validatable

  validates :first_name, :second_name, presence: true
end
