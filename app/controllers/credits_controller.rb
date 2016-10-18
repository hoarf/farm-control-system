class CreditsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: CreditsDatatable.new(view_context) }
    end
  end
end
