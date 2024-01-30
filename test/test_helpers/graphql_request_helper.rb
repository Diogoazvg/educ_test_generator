# frozen_string_literal: true

module GraphqlRequestHelper
  def graphql_request_var(query)
    klass.execute(query)
  end

  def graphql_success_request_var(query)
    graphql_request_var(query)['data']
  end

  def graphql_fail_request_var(query)
    graphql_request_var(query)['errors']
  end

  def graphql_request
    klass.execute(query)
  end

  def graphql_success_request
    graphql_request['data']
  end

  private

  def klass
    EducTestGeneratorSchema
  end
end
