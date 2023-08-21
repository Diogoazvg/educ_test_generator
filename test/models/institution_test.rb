# frozen_string_literal: true

require 'test_helper'

class InstitutionTest < ActiveSupport::TestCase
  # validates
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).scoped_to(:user_id)
  # _____________________________________
end
