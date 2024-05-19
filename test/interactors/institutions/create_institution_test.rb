require 'test_helper'

class CreateInstitutionTest < ActiveSupport::TestCase
  setup { @name = 'Some institution name' }

  test 'when try to create a institution but image_data is malformed' do
    @image_data = { test: '12345' }

    assert_raises Shrine::Error, "{'test'=>'12345'} isn't valid uploaded file data" do
      call
    end
  end
  test 'when try to create a institution with required data' do
    assert_equal(@name, call.institution.name)
  end

  private

  def call
    ::Institutions::CreateInstitution.call({ name: @name, image_data: @image_data, user_id: @user_id })
  end
end
