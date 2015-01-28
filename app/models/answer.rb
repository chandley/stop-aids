class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :candidate
  belongs_to :choice
end
