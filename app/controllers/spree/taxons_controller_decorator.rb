Spree::TaxonsController.class_eval do
  after_filter :mixpanel_track_taxon_visit, only: :show

  private
  def mixpanel_track_taxon_visit
    MixpanelTracker.new.track(spree_current_user.try(:id), 'Taxon Show', {name: @taxon.name})
  end
end