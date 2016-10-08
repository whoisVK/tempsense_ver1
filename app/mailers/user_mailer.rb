class UserMailer < ApplicationMailer
  default from: "networkwithsriram@gmail.com"
  def  notification_alert()
  	puts "coming inside mailer"
    
    mail(to: "csriram@freshdesk.com", subject: "Sample Email").deliver
  end


end
