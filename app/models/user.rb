class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :company_assignments
  has_many :companies, through: :company_assignments
  has_many :client_assignments
  has_many :clients, through: :client_assignments
  has_many :briefs
  has_many :mood_boards
  has_many :approvals
  has_many :brand_documents
  has_many :positioning_maps
  has_many :product_documents
  has_many :personas

  def self.from_omniauth(access_token)
  data = access_token.info
  user = User.where(email: data["email"]).first

  # Uncomment the section below if you want users to be created if they don't exist
  unless user
      user = User.create(first_name: data["first_name"],
        last_name: data["last_name"],
        email: data["email"],
        password: Devise.friendly_token[0,20]
      )
  end
  user
end

end
