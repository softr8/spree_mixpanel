require 'spec_helper'
describe Spree::Admin::MixpanelSettingsController do
  stub_authorization!
  describe '#edit' do
    it 'assigns a Spree::MixpanelConfiguration and render the view' do
      spree_get :edit
      expect(assigns(:config)).to be_an_instance_of(Spree::MixpanelConfiguration)
      expect(response).to render_template('edit')
    end
  end

  describe '#update' do
    it 'saves the project token preference and redirect to edit settings path' do
      spree_put :update, { project_token: '123' }
      expect(Spree::MixpanelConfiguration.new.send(:project_token)).to eq '123'
      expect(response).to be_redirect
    end
  end
end
