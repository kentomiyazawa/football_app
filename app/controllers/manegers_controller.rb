class ManegersController < ApplicationController
  def new
    @maneger = Maneger.new
  end

  def create
    @maneger = Maneger.create(maneger_params)
    redirect_to root_path
  end

  def edit
    @maneger = Maneger.find(params[:id])
  end

  def update
    @maneger = Maneger.find(params[:id])
    Maneger.update(maneger_params)
    redirect_to root_path
  end

  def destroy
    @maneger = Maneger.find(params[:id])
    @maneger.destroy
    redirect_to new_maneger_path
  end

  private 
  def maneger_params
    params.require(:maneger).permit(:name, :birthday, :nationally, :team_id)
  end
end
