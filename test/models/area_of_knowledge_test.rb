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
require 'test_helper'

class AreaOfKnowledgeTest < ActiveSupport::TestCase
  should have_many(:questions)
  should validate_presence_of(:subject)
  should validate_presence_of(:area_name)
end
