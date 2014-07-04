require File.expand_path('../../test_helper', __FILE__)
require 'mocha/test_unit'

class TimeEntryPatchTest < ActionController::TestCase
  fixtures :projects,
           :users,
           :roles,
           :member_roles,
           :members,
           :time_entries

  def test_check_project_time_reserve
    project = Project.first
    start = project.time_entries.sum :hours
    entry = project.time_entries.first

    CentosAdmin::TimeMailer.stubs(:little_time).returns(nil)

    entry.update_attributes hours: entry.hours

    assert true
  end
end
