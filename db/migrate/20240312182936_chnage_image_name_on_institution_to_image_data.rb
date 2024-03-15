# frozen_string_literal: true

class ChnageImageNameOnInstitutionToImageData < ActiveRecord::Migration[7.0]
  def change
    rename_column :institutions, :image, :image_data
  end
end
