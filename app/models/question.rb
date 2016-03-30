class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :question_votes

  def up_vote!
    self.question_vote = true
  end

  def down_vote!
    self.question_vote = false
  end

end