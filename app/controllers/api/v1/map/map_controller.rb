class Api::V1::Map::MapController < ApplicationController

  def index
    render json: MapState.all
  end
end
