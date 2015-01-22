class Ask < ActiveRecord::Base
  belongs_to :question
  belongs_to :candidate
  belongs_to :user
end
