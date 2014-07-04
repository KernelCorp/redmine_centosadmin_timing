module CentosAdmin
  class TimeMailer < ActionMailer::Base
    def little_time( project )
      @parent = parent
      mail to: email, subject: t('participant.invite.title')
    end
  end
end
