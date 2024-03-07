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
FactoryBot.define do
  factory :permission do
  end
end
