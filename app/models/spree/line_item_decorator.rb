Spree::LineItem.class_eval do

  after_create :mixpanel_track_cart_add
  after_destroy :mixpanel_track_cart_remove

  private
    def mixpanel_track_cart_add
      MixpanelTracker.new.async.track(order.user_id, 'Item added to cart',  { name: name, price: total.to_s, quantity: quantity })
    end

    def mixpanel_track_cart_remove
      MixpanelTracker.new.async.track(order.user_id, 'Item removed from cart', { name: name })
    end
end
