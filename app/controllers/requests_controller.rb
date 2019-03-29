class RequestsController < ApplicationController

  def index
    # @user = current_user
    # @profile = @user.profile
    # @requests = Request.where(profile_user_id: @user.id, request_status_id: 1)
    @user = current_user
    @profile = Profile.find(params[:profile_id])
    if @profile.user_id != @user.id
      flash[:notice] = 'You are not authorized to view this page.'
      redirect_to profile_path(@user.profile) and return
    end
    @requests = Request.where(profile_user_id: @user.id, request_status_id: 1)
  end

  def create
    @user = current_user
    @profile = Profile.find(params[:profile_id])
    @profile_user = @profile.user
    @my_profile_request = Request.where(profile_id: @profile.id, user_id: current_user.id)
    if @profile.user_id === @user.id
      flash[:alert] = 'You cannot send a request to yourself'
      redirect_to @profile and return
    end

    if @my_profile_request.count > 0
      flash[:alert] = "You've already sent a request to this user"
      redirect_to @profile and return
    end

    @request = @profile.requests.build(request_params)
    @request.update_attributes(user_id: @user.id, profile_user_id: @profile_user.id)
    if @request.save
      flash[:notice] = 'You have sent a request to this profile'
      redirect_to @profile
    else
      flash[:notice] = 'Something went wrong with your request'
      redirect_to @profile
    end
  end

  def accept
    @user = current_user
    @profile = Profile.find(params[:profile_id])
    @request = @profile.requests.find(params[:id])
    @request_sent_by = @request.user
    @request_sender_profile = @request_sent_by.profile
    @request.update_attributes(request_status_id: 2)
    FriendConnection.create!(user_id: @user.id, second_user_id: @request_sent_by.id, profile_id: @request_sent_by.profile.id, request_id: @request.id)
    flash[:notice] = "You just connected with #{@request_sent_by.email}"
    redirect_to profile_path(@request_sender_profile)
  end

  def reject
    @user = current_user
    @profile = Profile.find(params[:profile_id])
    @request = @profile.requests.find(params[:id])
    @request_sent_by = @request.user
    @request_sender_profile = @request_sent_by.profile
    @request.update_attributes(request_status_id: 3)
    flash[:notice] = "You just rejected #{@request_sent_by.email}'s request."
    redirect_to profile_requests_path(@profile)
  end

  private

  def request_params
    params.require(:request).permit(:request_message)
  end

end
