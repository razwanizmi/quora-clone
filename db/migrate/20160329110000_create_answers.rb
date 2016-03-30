class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description
      t.belongs_to :question
      t.belongs_to :user
      t.timestamps
    end
  end
end