class Spree::MixpanelConfiguration < Spree::Preferences::Configuration
  preference :project_token, :string, default: 'project_token'
end
