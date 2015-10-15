class ApplicationController < ActionController::API
  # before_filter :add_allow_credentials_headers
  #
  # def add_allow_credentials_headers
  #   response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
  #   response.headers['Access-Control-Allow-Credentials'] = 'true'
  #   response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
  #   response.headers['Access-Control-Request-Method'] = '*'
  #   response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  # end
end
