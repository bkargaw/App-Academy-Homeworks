class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user # this will be used in the view files
    mail(to: user.username, subject: welcome_email)
  end
end
