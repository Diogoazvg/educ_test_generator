# frozen_string_literal: true

namespace :add do
  desc 'To add permission names'
  task permissions: %i[environment] do
    query_and_mutations_name = %w[
      find_user_by_name
      signin
      signup
    ]

    query_and_mutations_name.each do |name|
      Permission.find_or_create_by!(permission_name: name) do
        puts "Add permission: #{name}"
      end
    end
  end
end
