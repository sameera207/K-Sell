class Outbox < ActiveRecord::Base
  set_table_name 'outbox'

  def self.send_format(number)
    format = "Invalid format\nBUY category description\nSELL category price description\n Ex: BUY mobile nokia"
    msg = Outbox.new(:number => number, :text => format)
    p '--- FORMAT ---'
    p msg
    #msg.save
  end

end
