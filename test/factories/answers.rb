# frozen_string_literal: true

# == Schema Information
#
# Table name: answers
#
#  id              :bigint           not null, primary key
#  complete_answer :string           not null
#  tag             :string
#  title           :string           not null
#  short_answer    :string
#  questions_id    :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :answer do
    complete_answer { 'MyString' }
    tag { 'MyString' }
    title { 'MyString' }
    short_answer { 'MyString' }
  end
end
