class Admins::JimsController < ApplicationController
  def index
    @jims = Jim.all
  end

  def update
    @jim = Jim.find(params[:id])
    @jim.update(jim_params)
    redirect_to request.referer
  end

  def create
    @jim_new = Jim.new(jim_params)
    @jim.save
    redirect_to jims_path
  end

  def new
    @jim_new = Jim.new
  end

  def show
    @jim = Jim.find(params[:id])
  end

  def edit
    @jim = Jim.find(params[:id])
  end

  private
    def jim_params
    params.require(:jim).permit(:jim_address,:jim_name,:jim_access,:jim_description,:jim_image_id)
  end
end
