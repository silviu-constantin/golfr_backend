class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sending_score.subject
  #
  def sending_score(user, score)
    @user = user
    @score = score
    mail to: @user.email, subject: "New score posted"
  end
end
