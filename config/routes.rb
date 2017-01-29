Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :v1, path: 'v1' do
    resources :jam_sessions, only: [:create, :show]

    resources :candidates, only: [:upcoming] do
      get 'upcoming'
    end

    resources :bands, only: [:upcoming] do
      get 'upcoming'
    end

    resources :band_members, only: [:upcoming] do
      get 'upcoming'
    end
  end
end
