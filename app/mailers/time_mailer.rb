# encoding: UTF-8
module CentosAdmin
  class TimeMailer < ActionMailer::Base
    def little_time( project )
      emails = project.managers.map{ |m| m.user.mail }
      mail to: emails, subject: "#{project.name}: осталось мало времени"
    end
  end
end
