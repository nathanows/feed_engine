class Api::V1::Education::DataController < ApplicationController
  

  def index
    render json: StateEducationData.all
  end
end
