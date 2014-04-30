Spree::Order.class_eval do

  after_update :mixpanel_track_purchase

  private
    def mixpanel_track_purchase
      MixpanelTracker.new.async.track_charge(user.id, total) if completed? && user
    end
end

