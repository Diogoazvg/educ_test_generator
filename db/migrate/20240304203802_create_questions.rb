# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :complete_question, null: false
      t.string :tag
      t.string :title, null: false
      t.references :area_of_knowledge, foreign_key: true

      t.timestamps
    end
  end
end
