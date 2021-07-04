class NotificationMailer < ApplicationMailer

  def notify_mail(user, comment)
    @user = user
    @comment = comment
    mail to: @user.email, subject: '投稿にコメントがありました'
  end

end
