class Spree::Admin::MixpanelSettingsController < Spree::Admin::BaseController

  def edit
    @config = Spree::MixpanelConfiguration.new
  end

  def update
    config = Spree::MixpanelConfiguration.new
    config[:project_token] = params[:project_token]
    redirect_to edit_admin_mixpanel_settings_path
  end
end
