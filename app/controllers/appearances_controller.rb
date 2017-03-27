class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def index
    @appearances = Appearance.all
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance = Appearance.find_by(params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])
    if @appearance.update_attributes(appearance_params)
      flash[:notice] = "Nice Job! Updated."
      redirect_to appearances_path
    else
      redirect_to edit_appearance_path(params[:id])
      flash[:notice] = "You did something wrong.  Try again."
    end
  end


  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

end
