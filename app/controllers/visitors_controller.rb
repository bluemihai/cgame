class VisitorsController < ApplicationController
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
