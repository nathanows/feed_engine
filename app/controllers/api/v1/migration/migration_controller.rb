class Api::V1::Migration::MigrationController < ApplicationController
  def index
    render json: GeneralMigrationData.all,
      each_serializer: GeneralMigrationDataSerializer
  end
end
