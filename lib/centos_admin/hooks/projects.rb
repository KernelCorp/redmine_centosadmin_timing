module CentosAdmin
  module Hooks
    class Projects < Redmine::Hook::ViewListener
      render_on :view_projects_form, partial: 'projects/form_additions'
      render_on :view_projects_show_sidebar_bottom, partial: 'projects/show_time_reserved'
    end
  end
end
