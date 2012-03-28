class UserMailer < ActionMailer::Base
  default :from => "chaitanya@vedavaag.com"

  def welcome_email(user)
    @user = user
    @url  = "http://vedavaag.com:4545"
    mail(:to => user.email, :subject => "Welcome to Vedavaag Employee Report System")
  end
end
