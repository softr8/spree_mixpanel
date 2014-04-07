require 'spec_helper'

describe Spree::LineItem do
  let(:user){ create(:user) }
  let(:order){ create(:order, user: user, completed_at: Date.today, total: 1) }
  let(:shipment){ create(:shipment) }
  let(:line_item){ create(:line_item, order: order, target_shipment: shipment) }

  describe '#mixpanel_track_cart_add' do
    before do
      properties = { name: line_item.name, price: line_item.total.to_s, quantity: line_item.quantity}
      MixpanelTracker.any_instance.should_receive(:track).with(user.id, 'Item added to cart', properties)
      end

    it 'sends the order total to mixpanel' do
      line_item.send(:mixpanel_track_cart_add)
    end
  end

  describe '#mixpanel_track_cart_remove' do
      before do
        properties = { name: line_item.name }
        MixpanelTracker.any_instance.should_receive(:track).with(user.id, 'Item removed from cart', properties)
      end

      it 'sends the order total to mixpanel' do
        line_item.send(:mixpanel_track_cart_remove)
      end
  end
end
