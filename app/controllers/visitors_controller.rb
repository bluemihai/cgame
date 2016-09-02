class VisitorsController < ApplicationController
  def wildcard
    rand_wc = Activity.wild_card.sample
    redirect_to activity_path(rand_wc)
  end
end
