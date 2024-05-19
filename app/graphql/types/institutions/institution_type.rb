# frozen_string_literal: true

module Types
  module Institutions
    class InstitutionType < GraphQL::Schema::Object
      field :id, Int, null: false
      field :user_id, Int, null: true
      field :name, String, null: false
      field :image_data, String, null: true
      field :created_at, String, null: false
      field :updated_at, String, null: false
      field :status, String, null: false
    end
  end
end
