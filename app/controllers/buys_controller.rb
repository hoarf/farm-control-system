class BuysController < ApplicationController

  def new
    @buy = Buy.new
    2.times { @buy.moves << Move.new }
    @buy.build_entry
  end

end
