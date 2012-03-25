namespace :sms do
  desc "SMS Gateway"
  task :process => :environment do
    inbox_messages = Inbox.find(:all, :conditions => {:processed => 0})
    inbox_messages.each do |msg|
      p '--- GATEWAY PROCESS ---'
      p msg

      msg.transfer()
      msg.update_attribute('processed', 1)
    end
  end
end
