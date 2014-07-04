Redmine::Plugin.register :centosadmin_redmine_plugin do
  name 'Centosadmin Redmine Plugin plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  require_dependency 'centos_admin/hooks/view_projects_form_hook'
end
