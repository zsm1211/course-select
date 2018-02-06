class Emails < ApplicationMailer
  default from: 'chrisleeshu@163.com'

  def index(sender,recipient,subject,body,recipient_email)
    @sender=sender
    @recipient=recipient
    @subject=subject
    @body=body
    @recipient_email=recipient_email
    mail(to: @recipient_email,title:"课程网站提醒", subject:@subject)
  end

end
