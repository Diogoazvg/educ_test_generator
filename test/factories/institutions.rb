# frozen_string_literal: true

FactoryBot.define do
  factory :institution do
    name { "John Doe_#{rand(99)}" }
  end
end
