class UserMailer < ActionMailer::Base
  default from: "shiljos@gmail.com"

  # def welcome_email(user)
  # 	@user = user
  # 	attachments['cola.jpeg'] = File.read('/home/shbuntu/rails/railstest/ProductPedia/app/assets/images/cola.jpeg')
  # 	mail(to: @user.email, subject: 'Thanks for logging in !')		  	
  # end

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Thanks for logging in !')		  	
  end
  
end
