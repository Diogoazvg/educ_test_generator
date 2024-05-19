# frozen_string_literal: true

module Institutions
  class CreateInstitution
    include Interactor

    delegate :name, :image_data, :user_id, to: :context

    def call
      context.institution = ::Institution.create!(name:, image_data:, user_id:)
    end
  end
end
