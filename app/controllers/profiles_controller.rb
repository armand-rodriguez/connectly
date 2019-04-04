class ProfilesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    if params[:q]
      search_term = params[:q]
      @users = User.where("user_name ilike ?", "%#{search_term}%")
    else
      @users = User.order("RANDOM()").limit(10)
    end


  end

  def show
    @profile = Profile.find(params[:id])
    @profile_requests = Request.where(profile_id: @profile.id, request_status_id: 1)
    @total_profile_requests = @profile_requests.count
    @my_profile_request = Request.where(profile_id: @profile.id, user_id: current_user.id)
    @my_profile_request_singular = Request.find_by(profile_id: @profile.id, user_id: current_user.id)
    @my_accepted_friend_connections = FriendConnection.find_by(profile_id: @profile.id, user_id: current_user.id)
    @comment = @profile.comments.build
    @comments = Comment.where(profile_id: @profile.id).order("created_at DESC")
  end

  def new
    @user = current_user
    @profile = @user.build_profile
  end

  def create
    @user = current_user
    @profile = @user.build_profile(profile_params)
    if @profile.save
      @user.update_attributes(registration_status_id: 2)
      redirect_to @profile
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end

  end

  private

  def profile_params
    params.require(:profile).permit(:about, :image)
  end

end
