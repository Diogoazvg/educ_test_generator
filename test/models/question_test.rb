# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id                   :bigint           not null, primary key
#  complete_question    :text             not null
#  tag                  :string
#  title                :string           not null
#  area_of_knowledge_id :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  should have_many(:answers)
  should belong_to(:area_of_knowledge)
  should validate_presence_of(:complete_question)
  should validate_presence_of(:title)
end
