class VisitorsController < ApplicationController
  def circlemeday
  end

  def jordan
    @special_invite = params.has_key?(:special_invite)
  end

  def welcome
  end

  def festival
    
  end

  def wildcard
    rand_wc = Activity.wild_card.sample
    redirect_to activity_path(rand_wc)
  end

  def values
  end
end
