module CentosAdmin
  class TimeMailer < ActionMailer::Base
    def little_time( project )
      emails = project.managers.map{ |m| m.user.mail }
      mail to: emails, subject: 'TIME HAS COME'
    end
  end
end
