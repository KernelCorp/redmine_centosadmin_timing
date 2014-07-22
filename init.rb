# Hooks
require_dependency 'centos_admin/hooks/view_projects_form_hook'

# Patches
require 'centos_admin/patches/project_patch'
require 'centos_admin/patches/time_entry_patch'

# Mailers
require_relative 'app/mailers/time_mailer'

# Plugin
Redmine::Plugin.register :redmine_centosadmin_timing do
  name 'Centosadmin Redmine timing'
  author 'CentosAdmin'
  description 'This is a plugin for CentosAdmin'
  version '0.1.0'
  url 'https://github.com/olemskoi/redmine_centosadmin_timing'
  author_url 'http://centos-admin.ru/'
  settings default: { 'managers_roles' => 'Manager' }, partial: 'settings/centosadmin_redmine_settings'
end
