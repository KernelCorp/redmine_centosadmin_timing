require File.expand_path('../../test_helper', __FILE__)

class ProjectPatchTest < ActionController::TestCase
  fixtures :projects,
           :users,
           :roles,
           :member_roles,
           :members,
           :time_entries

  def test_managers
    project = Project.first

    assert_equal project.members.count, 2

    managers = project.managers

    assert managers.is_a? Array
    assert managers.size == 1
    assert managers.first.roles.map(&:name).include? 'Manager'
  end

  def test_has_little_time
    project = Project.first

    start = project.time_entries.sum :hours

    assert start > 0
    assert project.time_reserve == 0.0

    {
      0.0 => false, 
      start-1 => true, 
      start+3 => false, 
      start+1 => true 
    }
    .each do |time, has_little|
      project.time_reserve = time
      assert project.has_little_time? == has_little
    end
  end
end
