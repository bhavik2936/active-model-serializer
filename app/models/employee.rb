class Employee < ApplicationRecord
  belongs_to :manager

  validates :name, :email, :dob, :mobile, :designation, :salary, presence: true
end
