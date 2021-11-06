Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/members', to: 'members#index'
      get '/members/:members_id', to: 'members#show'
      get '/members/:members_id/messages', to: 'messages#index'
    end
  end
end
