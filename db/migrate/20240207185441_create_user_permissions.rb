# frozen_string_literal: true

class CreateUserPermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_permissions do |t|
      t.references :user, foreign_key: true
      t.references :permission, foreign_key: true

      t.timestamps
    end
  end
end
