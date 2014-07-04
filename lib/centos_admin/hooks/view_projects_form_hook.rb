module CentosAdmin
  module Hooks
    class ViewProjectsFormHook < Redmine::Hook::ViewListener
      render_on :view_projects_form, partial: 'projects/form_additions'
    end
  end
end
