class UserMailer < ApplicationMailer
  default from: ENV['MAILER_EMAIL']

  def send_welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome!")
  end

  def send_broker_approved_email(user)
    mail(:to => user.email, :subject => "APPROVED BROKER ACCOUNT")
  end

end