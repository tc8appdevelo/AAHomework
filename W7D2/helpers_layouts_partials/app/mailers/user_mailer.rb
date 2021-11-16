class UserMailer < ApplicationMailer
    default form: 'form@example.com'

    def welcome_email(user)
        @user = user
        @url = 'http://localhost:3000/session/new'
        mail(to: @user.username, subject:'Welcome to 99 cats!')
    end
end
