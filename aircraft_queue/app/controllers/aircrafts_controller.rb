class AircraftsController < ApplicationController
  before_action :set_aircraft, only: [:show, :edit, :update, :destroy]

  def index
    @aircrafts = Aircraft.all
  end

  def show
  end

  def new
    @aircraft = Aircraft.new
  end

  def edit
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)
    aqm_request_process(ENQUEUE_REQUEST, @aircraft)
  end

  def update
    respond_to do |format|
      if @aircraft.update(aircraft_params)
        format.html { redirect_to @aircraft, notice: 'Aircraft was successfully updated.' }
        format.json { render :show, status: :ok, location: @aircraft }
      else
        format.html { render :edit }
        format.json { render json: @aircraft.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @aircraft.destroy
    respond_to do |format|
      format.html { redirect_to aircrafts_url, notice: 'Aircraft was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aircraft
      @aircraft = Aircraft.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aircraft_params
      params.require(:aircraft).permit(:flight_num, :flight_type, :flight_size)
    end
end
