Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/members/:members_id', to: 'members#index'
    end
  end
end
