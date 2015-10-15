class Api::V1::Education::EducationController < ApplicationController
  def index
    render json: GeneralEducationData.all, each_serializer: GeneralEducationDataSerializer
  end
end
