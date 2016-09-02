class Activity < ApplicationRecord

  scope :non_wild_card, -> { where(wild_card_weight: 0).where(active: true) }

  def key
    
  end
end
