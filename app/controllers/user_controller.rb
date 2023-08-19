class UserController < Devise::RegistrationsController
  
  def create
    super do |user|
      binding.pry
      user.create_default_profile(params[:user][:profile_id])
    end
  end

end
  