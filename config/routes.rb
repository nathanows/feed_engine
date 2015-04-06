Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :map do
        get '/', to: 'map#index'
      end

      namespace :poverty do
        get '/', to: 'poverty#index'
        get '/data', to: 'data#index'
        get '/tweets', to: 'tweets#index'
      end

      namespace :migration do
        get '/', to: 'migration#index'
        get '/data', to: 'data#index'
        get '/tweets', to: 'tweets#index'
      end

      namespace :education do
        get '/', to: 'education#index'
        get '/data', to: 'data#index'
        get '/tweets', to: 'tweets#index'
      end
    end
  end
end
