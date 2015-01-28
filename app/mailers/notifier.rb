class Notifier < ActionMailer::Base
default :from => 'alert@students-stop-aids.co.uk'

  def welcome (email)
    mail(to: email,
    subject: 'Thank you for signing up!')
  end

  def answers(email, link, candidate)
    @email = email
    @link = link
    @candidate = candidate
    mail(to: email,
    subject: 'Your question has been answered')
  end

end
