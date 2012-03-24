namespace :sms do
  desc "SMS Gateway"
  task :process => :environment do
    messages = Inbox.find(:all)
    p messages
  end
end
