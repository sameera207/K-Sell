class Message < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode
  
  def full_address
    "#{city}, Sri Lanka"
  end
  
end
