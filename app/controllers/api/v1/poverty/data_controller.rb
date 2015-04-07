class Api::V1::Poverty::DataController < ApplicationController

  def index
    render json: StatePovertyData.all, each_serializer: StatePovertyDataSerializer
  end
end
