class JimsController < ApplicationController
  def index
    @jims = Jim.all
  end

  def show
    @jim = Jim.find(params[:id])
  end

 private
    def jim_params
    params.require(:jim).permit(:jim_address,:jim_name,:jim_access,:jim_description,:jim_image_id)
  end
end
