# frozen_string_literal: true

module GraphqlRequestHelper
  def graphql_request_var(query, context)
    klass.execute(query, context:)
  end

  def graphql_success_request_var(query, context)
    graphql_request_var(query, context)['data']
  end

  def graphql_fail_request_var(query, context)
    graphql_request_var(query, context)['errors']
  end

  def graphql_request
    klass.execute(query, context:)
  end

  def graphql_success_request
    graphql_request['data']
  end

  def graphql_fail_request
    graphql_request['errors']
  end

  private

  def klass
    EducTestGeneratorSchema
  end
end
