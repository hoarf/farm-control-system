class DebitsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: DebitsDatatable.new(view_context) }
    end
  end
end
