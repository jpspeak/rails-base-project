class UserMailer < ApplicationMailer
  def send_welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to XTock!')
  end

  def send_broker_approved_email(user)
    mail(to: user.email, subject: 'APPROVED BROKER ACCOUNT')
  end
end
