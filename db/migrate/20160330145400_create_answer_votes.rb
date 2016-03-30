class CreateAnswerVotes < ActiveRecord::Migration
  def change
    create_table :answer_votes do |t|
      t.boolean :upvote
      t.belongs_to :answer
      t.belongs_to :user
      t.timestamps
    end
  end
end