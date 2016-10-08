class EmailNotificationWorker
  include Sidekiq::Worker
  def perform()
    UserMailer.notification_alert().deliver_later
  end
end