Spree::User.class_eval do
  after_create :mixpanel_create_user_profile

  private
  def mixpanel_create_user_profile
    properties = {
        '$email' => email,
        "$created" => created_at,
    }
    MixpanelTracker.new.create_user_profile(id, properties)
  end
end
