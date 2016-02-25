class InfosController < ApplicationController

  def show
  end

  def update
    @child = Child.find(params[:child_id])
    @info = @child.infos.last

    @info.update(info_params[:info])
    redirect_to user_children_path(@current_user.id)
  end

  def edit
    @child = Child.find(params[:child_id])
    @info = Info.find(params[:info_id])
    @user = @current_user
  end


  def new_forms
    room = @current_user.room
    Info.new_infos(room)
    redirect_to root_path
  end

  def create
  end

  private

  def info_params
    params.permit(info: [:diaper_m])
  end

end
