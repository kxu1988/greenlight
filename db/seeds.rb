# frozen_string_literal: true
# admin@example.com administrator

Role.create_default_roles("admin")
Rake::Task['admin:create'].invoke
