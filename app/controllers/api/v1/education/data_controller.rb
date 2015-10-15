class Api::V1::Education::DataController < ApplicationController

  def index
    render json: StateEducationData.all,
      each_serializer: StateEducationDataSerializer
  end
end
