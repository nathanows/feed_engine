class Api::V1::CommuteTime::DataController < ApplicationController

  def index
    render json: StateCommuteTimeData.all
  end
end