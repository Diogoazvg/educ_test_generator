# frozen_string_literal: true

module GraphqlRequestHelper
  def graphql_request(query_string)
    EducTestGeneratorSchema.execute(query_string)
  end

  def graphql_success_request(query_string)
    graphql_request(query_string)['data']
  end

  def graphql_fail_request(query_string)
    graphql_request(query_string)['errors']
  end
end
