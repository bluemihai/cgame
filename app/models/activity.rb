class Activity < ApplicationRecord

  scope :wild_card, -> { where('wild_card_weight > 0').where(active: true) }
  scope :non_wild_card, -> { where(wild_card_weight: 0).where(active: true) }
  scope :main, -> { where(main: true) }

  def key
    
  end
end
