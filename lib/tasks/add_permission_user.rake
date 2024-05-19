# frozen_string_literal: true

namespace :add do
  desc 'To add permission names'
  task user_permissions: %i[environment] do
    Permission.all.each do |p|
      UserPermission.find_or_create_by!(user: User.first, permission: p) do
        puts 'Add permision to user'
      end
    end
  end
end
