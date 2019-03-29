class StaticController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @profile = @user.profile
      if @user.registration_status_id === 1
        redirect_to new_profile_path
      elsif @user.registration_status_id === 2
        redirect_to @profile
      end
    end
  end
end
