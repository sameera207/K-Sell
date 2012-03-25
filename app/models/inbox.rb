class Inbox < ActiveRecord::Base
  set_table_name 'inbox'

  def parse
    #valid message format 
    #sell message: SELL <CATEGORY> <PRICE> <DESCRIPTION>
    #Ex: SELL mobile 15000 Nokia n90 phone with all the accessories
    #
    #buy message : BUY <CATEGORY> <DESCRIPTION> <PRICE> <CITY>
    #Ex: BUY mobile 15000 Nokia n90 17000 colombo

    type,category,message = WordSplitter.format_word(text)
    raise "ERROR: Invalid Type" unless ["BUY","SELL"].include?(type)
    raise "ERROR: Invalid Category" unless Category.catogories.include?(category)
    return true
  end

  def transfer

    begin

      type,category,message = WordSplitter.format_word(text)

      if type == "SELL"

        p '--- SELLING REQUEST ---'
        handle_sell(message, category)

      elsif type == "BUY"

        p '--- BUYING REQUEST ---'

      else
        raise InvalidMessageException
      end

    rescue InvalidMessageException
      p '--- INVALID MESSAGE ---'
      Outbox.send_format(number)
    rescue Exception => ex
      p '--- EXCEPTION TRANSFER ---'
      p ex.message
    end

  end
  
  def handle_sell (message, category)

    msg = message
    price = message.split(" ")[0]

    obj = Message.new()
    obj.phone_number = number
    obj.type = "SELL"
    obj.msg = WordSplitter.recreate_message(msg, 0).strip
    obj.price = price
    obj.city = city
    obj.key = category
    obj.save

  end
  
  def handle_buy(message, category)
    obj = Message.new()
    obj.phone_number = number
    obj.type = "BUY"
    obj.msg = message.strip
    obj.price = 0
    obj.city = city
    obj.key = category
    obj.save    
  end

  
  private
  def city
    gateway_record = Gateway.find_by_number(number)
    gateway_record.nil? ? "Colombo" : gateway_record.area
  end
    

end
