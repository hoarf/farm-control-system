class MovesController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: MovesDatatable.new(view_context) }
    end
  end
end
