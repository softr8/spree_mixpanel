require 'mixpanel-ruby'
require 'pry'
class MixpanelTracker

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

  def create_user_profile user_id, options = {}
    @tracker.people.set(user_id, options)
  end


  # Records a payment to the given user profile
  def track_charge user_id, total, options = {}
    @tracker.people.track_charge(user_id, total, options)
  end

  # A call to track is a report that an event has occurred.
  def track user_id, event, options = {}
    @tracker.track(user_id, event, options)
  end


end
