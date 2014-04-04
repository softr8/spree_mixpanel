Spree::User.class_eval do
  after_create :mixpanel_create_user_profile

  private
  def mixpanel_create_user_profile
    MixpanelTracker.new.create_user_profile(id, {'$email' => email })
  end
end
