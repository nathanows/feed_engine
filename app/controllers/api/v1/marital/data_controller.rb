class Api::V1::Marital::DataController < ApplicationController
  def index
    render json: StateMaritalData.all,
      each_serializer: StateMaritalDataSerializer
  end
end
