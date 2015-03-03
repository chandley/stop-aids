class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :candidate
  belongs_to :choice

  def askers
    asks = Ask.where(question_id: question_id, candidate_id: candidate_id)
    askers = asks.map { |ask| User.find(ask.user_id) }
  end

  def alert_all_askers
    askers.each do |asker|
      Notifier.answers(asker.email, self.candidate, asker.answers_link(self.candidate)).deliver
    end
  end
  
end
