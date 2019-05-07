class UserMailer < ApplicationMailer
  default from: 'guncho@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://quiet-beyond-87980.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def new_record_notification(record)
    @record = record
    mail to: 'guncho@gmail.com', subject: 'Email for mailgun sent from Blocmarks!'
  end
end
