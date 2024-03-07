# frozen_string_literal: true

# == Schema Information
#
# Table name: institutions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  image      :jsonb
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class InstitutionTest < ActiveSupport::TestCase
  # validates
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).scoped_to(:user_id)
  # _____________________________________
end
