# frozen_string_literal: true

# == Schema Information
#
# Table name: institutions
#
#  id         :bigint           not null, primary key
#  name       :string
#  image      :jsonb
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Institution < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
