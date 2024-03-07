# frozen_string_literal: true

# == Schema Information
#
# Table name: permissions
#
#  id              :bigint           not null, primary key
#  permission_name :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Permission < ApplicationRecord
  has_many :user_permissions
  has_many :users, through: :user_permissions
  validates :permission_name, presence: true
end
