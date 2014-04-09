Spree::Core::Engine.routes.append do
  namespace :admin do
    resource :mixpanel_settings, only: [:edit, :update]
  end
end
