Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/map'", to: "map#show"

      namespace :poverty do
        get "/", to: "poverty#index"
        get "/data", to: "data#index"
        get "/tweets", to: "tweets#index"
      end

      namespace :commute_time do
        get "/", to: "commute_time#index"
        get "/data", to: "data#index"
        get "/tweets", to: "tweets#index"
      end
    end
  end


end
