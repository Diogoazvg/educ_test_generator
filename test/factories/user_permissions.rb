# frozen_string_literal: true

# == Schema Information
#
# Table name: user_permissions
#
#  id            :bigint           not null, primary key
#  user_id       :bigint
#  permission_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :user_permission do
    user

    transient do
      permission_name { 'signin' }
    end

    factory :user_with_permission do
      after(:build) do |user_permission, evaluator|
        user_permission.permission = create(:permission, permission_name: evaluator.permission_name)
      end
    end
  end
end
