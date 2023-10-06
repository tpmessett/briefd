class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :company_assignments
  has_many :companies, through: :company_assignments
  has_many :client_assignments
  has_many :clients, through: :client_assignments
  has_many :briefs
  has_many :mood_boards
end
