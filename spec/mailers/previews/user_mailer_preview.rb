# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/sending_score
  def sending_score
    user = User.first 
    score = user.scores.first
    UserMailer.sending_score(user,score)
  end

end
