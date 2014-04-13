Spree::ProductsController.class_eval do
  after_filter :mixpanel_track_search, only: :index
  after_filter :mixpanel_track_product_show, only: :show

  private
  def mixpanel_track_search
    if params[:keywords]
      MixpanelTracker.new.track(spree_current_user.id, 'Product search', { keywords: params[:keywords] })
    else
      MixpanelTracker.new.track(spree_current_user.id, 'Products')
    end
  end

  def mixpanel_track_product_show
    MixpanelTracker.new.track(spree_current_user.id, 'Product Show', @product.name)
  end
end
