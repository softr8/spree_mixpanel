Spree::CheckoutController.class_eval do
  after_filter :track_mix_panel_update, only: [:update]

  private

  def track_mix_panel_update
    MixpanelTracker.new.async.track(spree_current_user.try(:id), "Order #{@order.state}", {price: @order.total})
  end

end