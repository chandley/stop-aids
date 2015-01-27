class Candidate < ActiveRecord::Base
  belongs_to :constitency
  belongs_to :party
  has_many :asks

  def questions_asked_more_times_than(threshold)
    Question.all.select {|question| question.asked_count(self) > threshold}
  end

  def twitter_image_url
    $twitter.user(self.twitter).profile_image_url_https.to_s
  end

  def get_answer_page
    return 'http://bit.ly/1yYTJY9'
  end

  def tweet_at_candidate()
    if self.twitter.nil?
      raise_error 'Please get twitter address for ' + self.name
    else
      $twitter.update(self.twitter + ' You have questions waiting for you at ' + get_answer_page )
  end

end
