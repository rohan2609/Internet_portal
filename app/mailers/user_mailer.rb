class UserMailer < ApplicationMailer
	default from: 'dhanshree.j.kamble@gmail.com'

	 def send_signup_email(user)
    @user = user
     user = "#{@user.email}"
     password = "#{@user.password}"
    mail( :to => user,
          :subject => 'Thanks for signing up for our amazing app' )
  end
end


 	