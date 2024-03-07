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
class Answer < ApplicationRecord
  belongs_to :question
  validates :complete_answer, :title, presence: true
end
