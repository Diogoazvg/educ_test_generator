# frozen_string_literal: true

class CreateAreaOfKnowledges < ActiveRecord::Migration[7.0]
  def change
    create_table :area_of_knowledges do |t|
      t.string :subject, null: false
      t.string :area_name, null: false

      t.timestamps
    end
  end
end
