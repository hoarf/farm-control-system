class SalesController < ApplicationController

  # GET /vendas/novo
  def new
    @sale = Sale.new
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    respond_to do |format|
      if @sale.valid?
        format.html { redirect_to livrodiario_path, notice: 'Fato cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def sale_params
    params.fetch(:sale, {}).permit(
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
