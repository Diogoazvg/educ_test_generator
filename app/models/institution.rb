# frozen_string_literal: true

# == Schema Information
#
# Table name: institutions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  image_data :jsonb
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'uploaders/image_uploader'

class Institution < ApplicationRecord
  include Uploaders::ImageUploader::Attachment(:image)

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
