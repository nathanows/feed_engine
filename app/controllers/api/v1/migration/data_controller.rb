class Api::V1::Migration::DataController < ApplicationController
  def index
    render json: StateMigrationData.all
  end
end
