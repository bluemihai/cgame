class VisitorsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only!, only: :wildcard

  def circlemeday
  end

  def jordan
    @special_invite = params.has_key? :special_invite
  end

  def welcome
  end

  def festival
    
  end

  def series
    @registered = params.has_key? :registered
  end

  def cobalt
    
  end

  def defaultcopy
    
  end

  def wildcard
    @wildcards = Activity.wild_card.shuffle
    @rand_wc = Activity.wild_card.sample
    # redirect_to activity_path(rand_wc)
  end

  def values
  end
end
