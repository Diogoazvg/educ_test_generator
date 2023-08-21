# frozen_string_literal: true

class CreateInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :institutions do |t|
      t.string :name
      t.jsonb :image
      t.references :user

      t.index %i[name user_id], unique: true
      t.timestamps
    end
  end
end
