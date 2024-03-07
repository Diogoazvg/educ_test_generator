# frozen_string_literal: true

# == Schema Information
#
# Table name: area_of_knowledges
#
#  id         :bigint           not null, primary key
#  subject    :string           not null
#  area_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :area_of_knowledge do
    subject { 'MyString' }
    area_name { 'MyString' }
  end
end
