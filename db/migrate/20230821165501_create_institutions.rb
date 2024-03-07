# frozen_string_literal: true

class CreateInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :institutions do |t|
      t.string :name, null: false
      t.jsonb :image
      t.references :user

      t.index %i[name user_id], unique: true
      t.timestamps
    end
  end
end
