# frozen_string_literal: true

module Users
  class FindUserByName
    include Interactor

    delegate :name, to: :context

    def call
      context.user = ::User.find_by(first_name: name)
    end
  end
end
