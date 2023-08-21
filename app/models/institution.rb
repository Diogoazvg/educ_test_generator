# frozen_string_literal: true

class Institution < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
