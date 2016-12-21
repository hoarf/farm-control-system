class BuysController < ApplicationController

  # GET /vendas/novo
  def new
    @buy = Buy.new
  end

  # POST /buys
  # POST /buys.json
  def create
    @buy = Buy.new(buy_params)
    respond_to do |format|
      if @buy.valid?
        format.html { redirect_to livrodiario_path, notice: 'Fato cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def buy_params
    params.fetch(:buy, {}).permit(
      :date,
      :description,
      :evidence,
      :partner_id,
      :amount,
      :amount_males,
      :amount_females,
    )
  end

end
