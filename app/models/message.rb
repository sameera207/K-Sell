class Message < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode
  
  scope :by_key, lambda {|search_key|
    {:conditions => "`key` like '#{search_key}%'"}
  }
  
  scope :by_msg, lambda {|search_key|
    {:conditions => "msg like '#{search_key}%'"}
  }
  
  
  
  def full_address
    "#{city}, Sri Lanka"
  end
  
  
end
