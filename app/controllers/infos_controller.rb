class InfosController < ApplicationController

  def show
  end

  def update
    @info = Info.find(params[:id])
    @child = Child.find(@info.child.id)
    @info.update(info_params[:info])
    redirect_to user_children_path(@current_user.id)
  end

  def edit
    @child = Child.find(params[:child_id])
    @info = Info.find(params[:id])
    @date = @info.created_at.strftime('%D')
    @user = @current_user
  end


  def new_forms
    room = @current_user.room
    Info.new_infos(room)
    redirect_to root_path
  end


  private

  def info_params
    params.permit(info: [:diaper_m, :diaper_a, :diaper_n, :breakfast, :lunch, :afternoon, :sleep_time, :general, :more_daiper, :more_wipes, :more_clothes])
  end

end
