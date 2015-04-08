class Api::V1::Marital::MaritalController < ApplicationController
  def index
    render json: GeneralMaritalData.all,
      each_serializer: GeneralMaritalDataSerializer
  end
end
