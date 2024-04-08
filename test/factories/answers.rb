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
#  question_id     :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :answer do
    complete_answer { 'Some Complete Answer' }
    tag { 'some_tag' }
    title { 'Some Title' }
    short_answer { 'Some Short Answer' }
  end
end
