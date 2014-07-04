# Hooks
require_dependency 'centos_admin/hooks/view_projects_form_hook'

# Patches
require 'centos_admin/patches/project_patch'
require 'centos_admin/patches/time_entry_patch'

# Mailers
require_relative 'app/mailers/time_mailer'

# Plugin
Redmine::Plugin.register :centosadmin_redmine_plugin do
  name 'Centosadmin Redmine Plugin plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  settings default: { 'managers_roles' => 'Manager' }, partial: 'settings/centosadmin_redmine_settings'
end
