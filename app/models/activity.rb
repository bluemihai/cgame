class Activity < ApplicationRecord
  has_many :haikus

  before_create :randomize_id

  scope :wild_card, -> { where('wild_card_weight > 0').where(active: true) }
  scope :non_wild_card, -> { where(wild_card_weight: 0).where(active: true) }
  scope :main, -> { where(main: true) }

  def id_obscured
    id.to_s.last(3)
  end

  def latest_haiku
    return haiku if haikus.empty?
    haikus.order(:created_at).last
  end

  def update_id_as_random
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Activity.where(id: self.id).exists?
    self.save!
  end

  private
    def randomize_id
      begin
        self.id = SecureRandom.random_number(1_000_000)
      end while Activity.where(id: self.id).exists?
    end

end
