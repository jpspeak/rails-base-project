class UserMailer < ApplicationMailer
  default from: 'for.testing.ange@gmail.com'

  def send_welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome!')
  end

  def send_broker_approved_email(user)
    mail(to: user.email, subject: 'APPROVED BROKER ACCOUNT')
  end
end
