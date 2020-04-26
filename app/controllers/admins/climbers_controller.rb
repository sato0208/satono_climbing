class Admins::ClimbersController < ApplicationController
  def index
    @climbers = Climber.all
  end

  def show
    @climber = Climber.find(params[:id])
  end

  def edit
    @climber = Climber.find(params[:id])
  end

  def update
    @climber = Climber.find(params[:id])
    @climber.update(climber_params)
    redirect_to request.referer
  end
  private
  def climber_params
    params.require(:climber).permit(:name, :name_kana,:post_code,:address,:phone_number,:is_member_status,:jim_id)
  end
end
