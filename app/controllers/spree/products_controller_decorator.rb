Spree::ProductsController.class_eval do
  after_filter :mixpanel_track_search, only: :index
  after_filter :mixpanel_track_product_show, only: :show

  private
  def mixpanel_track_search
    if params[:keywords]
      MixpanelTracker.new.async.track(spree_current_user.try(:id), 'Product search', { keywords: params[:keywords], results: @products.total_count })
    else
      MixpanelTracker.new.async.track(spree_current_user.try(:id), 'Products')
    end
  end

  def mixpanel_track_product_show
    MixpanelTracker.new.async.track(spree_current_user.try(:id), 'Product Show', {name: @product.name, price: @product.price.to_s})
  end
end
