class NotificationsMailer < ActionMailer::Base

  default :from => "vakaniehuisje@serooskerke.nl"
  default :to => "peter_vd_berg@hotmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Serooskerke] #{message.subject}")
  end

end