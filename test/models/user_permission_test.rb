# frozen_string_literal: true

# == Schema Information
#
# Table name: user_permissions
#
#  id            :bigint           not null, primary key
#  user_id       :bigint
#  permission_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class UserPermissionTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:permission)
end
