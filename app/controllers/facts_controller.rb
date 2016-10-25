class FactsController < ApplicationController

  before_action :set_fact, only: [:show, :edit, :update, :destroy]

  # GET /facts
  # GET /facts.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: FactsDatatable.new(view_context) }
    end
  end

  # GET /facts/1
  # GET /facts/1.json
  def show
  end

  # GET /facts/new
  def new
    @fact = Fact.new
    2.times { @fact.moves << Move.new }
    @fact.build_entry
  end

  # GET /facts/1/edit
  def edit
  end

  # POST /facts
  # POST /facts.json
  def create
    @fact = Fact.new(fact_params)
    respond_to do |format|
      if @fact.save
        format.html { redirect_to livrodiario_path, notice: 'Fato cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @fact }
      else
        format.html { render :new }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facts/1
  # PATCH/PUT /facts/1.json
  def update
    respond_to do |format|
      if @fact.update(fact_params)
        format.html { redirect_to @fact, notice: 'Fato atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @fact }
      else
        format.html { render :edit }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1
  # DELETE /facts/1.json
  def destroy
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to facts_url, notice: 'Fato apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact
      @fact = Fact.includes(:moves, :entry).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fact_params
      params.fetch(:fact, {}).permit(
        :date,
        :description,
        :evidence,
        :partner_id,
        moves_attributes: [
          :id,
          :type,
          :account_id,
          :amount,
          :_destroy,
        ],
        entry_attributes: [
          :type,
          :id,
          :inventory_id,
          :_destroy,
          :amount
        ],
      )
    end
end
