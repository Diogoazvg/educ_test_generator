# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :complete_answer, null: false
      t.string :tag
      t.string :title, null: false
      t.string :short_answer
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
