class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one :company
  has_many :applicants
  has_many :profile_users
  has_many :profiles, through: :profile_users
  attr_accessor :profile_id

  def profile
    profile_user = ProfileUser.find_by(user_id: self.id)
    Profile.find_by(id: profile_user.profile_id)
  end

  def create_default_profile(profile_id)
    if profile_id.present?
      ProfileUser.create(user_id: self.id, profile_id: profile_id)
    else
      ProfileUser.create(user_id: self.id, profile_id: Profile.find_by(name:"Candidato").id)
    end
  end
end
