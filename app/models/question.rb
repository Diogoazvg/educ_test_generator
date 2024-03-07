# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id                    :bigint           not null, primary key
#  complete_question     :text             not null
#  tag                   :string
#  title                 :string           not null
#  area_of_knowledges_id :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Question < ApplicationRecord
  belongs_to :area_of_knowledge
  has_many :answers
  validates :complete_question, :title, presence: true
end
