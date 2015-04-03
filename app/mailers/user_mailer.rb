class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def deleted_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Your Rotten Mangoes account has been deleted')
  end

end
