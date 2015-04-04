class Api::V1::Poverty::DataController < ApplicationController
  def index
    render json: StatePovertyData.all
  end
end
