require File.expand_path('../../test_helper', __FILE__)

class CentosAdmin::TimeMailerTest < ActionMailer::TestCase
  fixtures :projects,
           :users,
           :roles,
           :member_roles,
           :members 

  def test_little_time
    project = Project.first
    managers = project.managers
    assert managers.size == 1
    manager = managers.first
    project.update_attributes! time_reserve:(1+project.time_entries.sum(:hours))
    project.reload

    email = CentosAdmin::TimeMailer.little_time(project).deliver
    assert ActionMailer::Base.deliveries.empty? == false

    assert email.to.size == 1
    assert email.to[0].blank? == false
    assert email.to == [ manager.user.mail ]

    assert email.body.blank? == false
  end
end
