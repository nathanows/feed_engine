class Api::V1::Poverty::PovertyController < ApplicationController
  def index
    render json: GeneralPovertyData.all, 
      each_serializer: GeneralPovertyDataSerializer
  end
end
