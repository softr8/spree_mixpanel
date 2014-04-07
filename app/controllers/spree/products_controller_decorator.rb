Spree::ProductsController.class_eval do
  after_filter :mixpanel_track_search, only: :index

  private
  def mixpanel_track_search
    MixpanelTracker.new.track(spree_current_user.id, 'Product search', { keywords: params[:keywords] })
  end
end
