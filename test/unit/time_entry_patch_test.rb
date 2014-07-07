require File.expand_path('../../test_helper', __FILE__)

class TimeEntryPatchTest < ActiveSupport::TestCase
  fixtures :projects,
           :users,
           :roles,
           :member_roles,
           :members,
           :time_entries

  def test_check_project_time_reserve
    project = Project.first
    start = project.time_entries.sum :hours

    [ 
      0.0,
      start-1,
      start+3,
      start+1 
    ]
    .each do |time_reserve|
      project.update_attributes! time_reserve: time_reserve, time_reminder_sended: false
      project.reload
      entry = project.time_entries.first

      assert_difference 'ActionMailer::Base.deliveries.size', ( project.has_little_time? ? +1 : 0 ) do
        entry.update_attributes! hours: entry.hours
        project.reload
      end
    end

    project.update_attributes! time_reserve: start, time_reminder_sended: true
    project.reload
    entry = project.time_entries.first

    assert_difference 'ActionMailer::Base.deliveries.size', 0 do
      entry.update_attributes! hours: entry.hours
    end
  end
end
