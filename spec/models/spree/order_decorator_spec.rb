require 'spec_helper'

describe Spree::Order do
  describe '#mixpanel_track_purchase' do
    let(:user){ create(:user) }
    let(:order){ create(:order, user: user, completed_at: Date.today, total: 1) }
    before{ MixpanelTracker.any_instance.should_receive(:track_charge).with(user.id, order.total) }

    it 'sends the order total to mixpanel' do
      order.send(:mixpanel_track_purchase)
    end
  end
end
