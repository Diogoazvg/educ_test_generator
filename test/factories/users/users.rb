# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    password { '12345678' }
    first_name { 'John' }
    last_name { 'Doe' }
    email { "johndoe#{rand(99)}@email.com" }
  end
end
