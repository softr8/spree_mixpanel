Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :mixpanel_settings, only: [:edit, :update]
  end
end
