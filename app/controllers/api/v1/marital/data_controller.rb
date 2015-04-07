class Api::V1::Marital::DataController < ApplicationController

  def index
    render json: StateMaritalData.all
  end
end