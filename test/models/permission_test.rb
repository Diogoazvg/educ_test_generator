# frozen_string_literal: true

# == Schema Information
#
# Table name: permissions
#
#  id              :bigint           not null, primary key
#  permission_name :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  should have_many(:user_permissions)
  should have_many(:users)
  should validate_presence_of(:permission_name)
end
