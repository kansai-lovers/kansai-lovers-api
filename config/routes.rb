Rails.application.routes.draw do
  get '/member/:user_id', to: 'hellos#show'
end
