class FarmsController < ApplicationController
  before_action :set_farm, only: [:show]

  # GET /farms/1
  # GET /farms/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm
      @farm = current_user.farm
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farm_params
      params.require(:farm).permit(:show)
    end
end
