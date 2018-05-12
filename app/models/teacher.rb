class Teacher < ApplicationRecord
  acts_as_messageable
  mount_uploader :photo, AvatarUploader

  def mailboxer_email(*)
    email
  end

  devise :invitable, :database_authenticatable, :recoverable,
    :rememberable, :trackable, :registerable, :validatable

  validates :first_name, :second_name, presence: true

  has_many :courses, dependent: :destroy
end
