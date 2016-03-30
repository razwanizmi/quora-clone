class CreateQuestionVotes < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.boolean :upvote
      t.belongs_to :question
      t.belongs_to :user
      t.timestamps
    end
  end
end