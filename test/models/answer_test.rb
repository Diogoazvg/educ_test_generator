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
require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # validates
  should belong_to(:question)
  should validate_presence_of(:complete_answer)
  should validate_presence_of(:title)
  # _____________________________________

  test 'should normalize title to title case' do
    answer = build(:answer, title: 'valid title')

    assert_equal 'Valid Title', answer.title
  end

  test 'should normalize tag to lowercase and strip whitespace' do
    answer = build(:answer, tag: '  EXAMPLE Tag  ')

    assert_equal 'example tag', answer.tag
  end
end
