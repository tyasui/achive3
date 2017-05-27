class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_contribution.subject
  #
  def sendmail_contribution(contribution)
    @contribution = contribution

    mail to: "hinakona2@gmail.com",
         subject: '【Achieve】新規投稿されました'
  end
end
