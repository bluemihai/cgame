class Location < ApplicationRecord

  def full
    "#{name} (#{street_address}, #{city} #{state} #{zip})"
  end
end
