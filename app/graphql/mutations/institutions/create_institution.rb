# frozen_string_literal: true

module Mutations
  module Institutions
    class CreateInstitution < Mutations::BaseMutation
      include Errors::GraphqlErrors
      graphql_name 'Create_Institution'

      argument :name, String, required: true
      argument :image_data, String, required: false
      argument :user_id, Int, required: false

      type Types::Institutions::InstitutionType

      def resolve(**args)
        ::Institutions::CreateInstitution.call(args).institution.attributes.merge(status: 'success')
      rescue StandardError
        default_graphql_error('not_created', 'NOT_CREATED')
      end
    end
  end
end
