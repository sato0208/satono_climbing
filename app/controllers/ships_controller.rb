class ShipsController < ApplicationController
  def index
    @ships = Ship.all
    @ship_new = Ship.new
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def destroy
    ship = Ship.find(params[:id])
    ship.destroy
  end

  def update
    ship = Ship.find(params[:id])
    ship.update(ship_params)
    redirect_to ships_path
  end

  def create
    ship = Ship.new(ship_params)
    ship.climber_id = current_climber.id
    ship.save
    redirect_to ships_path
  end

  private
  def ship_params
    params.require(:ship).permit(:climber_id, :address, :name, :code)
  end
end
