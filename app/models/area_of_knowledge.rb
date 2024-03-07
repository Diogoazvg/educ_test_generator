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
class AreaOfKnowledge < ApplicationRecord
  has_many :questions
  validates :subject, :area_name, presence: true
end
