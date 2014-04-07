require 'spec_helper'

describe Spree::User do
  describe '#mixpanel_create_user_profile' do

    before{ MixpanelTracker.any_instance.should_receive(:create_user_profile).with(subject.id, { '$email' => subject.email } ) }

    it 'sends the order total to mixpanel' do
      subject.send(:mixpanel_create_user_profile)
    end
  end
end
