require 'mixpanel-ruby'
require 'celluloid'
class MixpanelTracker
  include Celluloid

  def initialize
    project_token = Spree::Mixpanel::Config[:project_token]
    @tracker = Mixpanel::Tracker.new(project_token)
  end

  # It creates a new profile in mixpanel's dashboard in the folllowing hash format, the only defaulted
  # value is email, for more data pass in an options hash.
  #
  #    "$first_name": "Joe",
  #    "$last_name": "Doe",
  #    "$email": "joe.doe@example.com",
  #    "$created": "2013-04-01T13:20:00",
  #    "$phone": "4805551212"

  def create_user_profile user_id, properties = {}
    unless ['development', 'test'].include?(Rails.env)
      @tracker.people.set(user_id, properties) rescue nil
    end
  end

  # Records a payment to the given user profile
  def track_charge user_id, total, properties = {}
    unless ['development', 'test'].include?(Rails.env)
      @tracker.people.track_charge(user_id, total, properties) rescue nil
    end
  end

  # A call to track is a report that an event has occurred.
  def track user_id, event, properties = {}
    unless ['development', 'test'].include?(Rails.env)
      @tracker.track(user_id, event, properties) rescue nil
    end
  end

  def async
    if ENV['SPREE_MIXPANEL_STRICT']
      super
    else
      begin
        super
      rescue Exception => e
        Rails.logger.info(e.message)
        self
      end
    end
  end
end
