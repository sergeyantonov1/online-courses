class Manager < ApplicationRecord
  devise :invitable, :database_authenticatable, :recoverable,
    :rememberable, :trackable, :registerable, :validatable

  validates :first_name, :second_name, presence: true
end
