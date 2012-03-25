class Message < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode
  
  scope :by_key, lambda {|search_key|
    {:conditions => ["`key` like ?", "#{search_key}%"]}
  }
  
  scope :by_msg, lambda {|search_key|
    {:conditions => ["msg like ?", "#{search_key}%"]}
  }
  
  scope :by_price, lambda {|price|
    {:conditions => ["price <= ?", "#{price}"]}
  }
  
  scope :by_exact_key, lambda {|search_key|
    {:conditions => ["`key` = ?", "#{search_key}"]}
  }
  
  scope :sell_messages, lambda{
    {:conditions => "message_type='SELL'" }
  }
  
  scope :buy_messages, lambda{
    {:conditions => "message_type='BUY'" }
  }
  
  scope :latest_10, lambda {
    {:order => "created_at desc",
     :limit => 10
    }
  }
  
  def full_address
    "#{city}, Sri Lanka"
  end
  
  
  def search_matches(key, type, city = nil)
    messages = []
    if type == "BUY"
      results = Message.buy_messages.by_exact_key(key)
    else  
      results = Message.sell_messages.by_exact_key(key)
    end
    
    if city.nil?
      messages = results
    else
      messages = results.near(city, 10, :order => :distance)     
    end
    messages
  end
  
  def sms_result_list(key, type)
    msg = ""
    messages = search_matches(key, type).latest_10
    messages.each do |message|
      msg << "#{message.phone_number.to_s} | #{message.price.to_s} | #{message.msg.to_s[0..15]}\n" 
    end
    if msg.length == 0
      msg = "No result, We will notify soon..."
    end
    msg
  end
  
end
