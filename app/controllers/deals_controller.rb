# coding: utf-8
class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  # GET /deals
  # GET /deals.json
  def index
    if params[:partner_id]
      @buys = Deal.buys.where(partner_id: params[:partner_id])
      @sales = Deal.sales.where(partner_id: params[:partner_id])
      @partner_name = Partner.find(params[:partner_id])
    else
      @buys = Deal.buys
      @sales = Deal.sales
    end
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
  end

  # GET /deals/new
  def new
    @deal = Deal.new
    @partners = Partner.all.collect { |p| [ p.name, p.id ] }
  end

  # GET /deals/1/edit
  def edit
    @partners = Partner.all.collect { |p| [ p.name, p.id ] }
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Negócio foi cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update

    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Negócio atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Negócio removido com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:date, :price, :males, :females, :live_weight, :dead_weight, :deal_type, :reason, :partner_id)
    end
end
