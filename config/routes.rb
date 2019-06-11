Rails.application.routes.draw do
  root to: 'welcome#index'

  get :search, controller: :welcome

  namespace 'api' do
    namespace 'v1' do
      resources :movies
    end
  end

end
