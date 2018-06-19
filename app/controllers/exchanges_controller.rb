class ExchangesController < ApplicationController
  def index
  end

  def convert
    value = ExchangeService.new(params[:source_currency], params[:target_currency], params[:amount]).perform
    valuebit = ExchangeService.new(params[:source_currency], params[:target_currency], params[:amount]).execute
    render json: {"value": value, "valuebit": valuebit }
  end
end
