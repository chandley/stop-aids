class Notifier < ActionMailer::Base
default :from => 'alert@studentsstopaidsapp.co.uk'

  def welcome (email)
    mail(to: email,
    subject: 'Thank you for signing up!')
  end

end
