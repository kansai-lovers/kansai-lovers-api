Rails.application.routes.draw do
  get '/hello/:user_name', to: 'hellos#show'
end
