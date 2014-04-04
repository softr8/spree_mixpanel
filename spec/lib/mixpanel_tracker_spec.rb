require 'spec_helper'

describe MixpanelTracker do
  let(:token){ Spree::Mixpanel::Config[:project_token] }
  let(:people){ Mixpanel::People.new token }
  let(:user){ mock_model(Spree::User)}

  describe '#initialize' do
    before do
      Mixpanel::Tracker.should_receive(:new).with(token)
    end

    it 'assings tracker instance variable' do
      MixpanelTracker.new
    end
  end

  context 'people trackers' do
    before{ Mixpanel::Tracker.any_instance.should_receive(:people).and_return people }

    describe '#create_user_profile' do
      before{ people.should_receive(:set).with(user.id, {}) }

      it 'creates the user profile in mixpanel' do
        subject.create_user_profile(user.id)
      end
    end

    describe '#track_charge' do
      before{ people.should_receive(:track_charge).with(user.id, 1, {}) }

      it 'tracks the user purchase' do
        subject.track_charge(user.id, 1)
      end
    end
  end



  describe '#track' do
    before{ Mixpanel::Tracker.any_instance.should_receive(:track).with(user.id, 'event', {} )}

    it 'tracks any kind of event the user passes in' do
      subject.track(user.id, 'event')
    end
  end
end
