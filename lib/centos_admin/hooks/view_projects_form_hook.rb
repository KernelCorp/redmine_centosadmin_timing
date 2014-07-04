module CentosAdmin
  module Hooks
    class ViewProjectsFormHook < Redmine::Hook::ViewListener
      render_on(:view_projects_form, partial: 'projects/form_additions', layout: false)
    end
  end
end