require_dependency 'time_entry'

module CentosAdmin
  module Patches
    module TimeEntryPatch
      def self.included( base )
        base.send :include, InstanceMethods

        base.class_eval do
          after_save :check_project_time_reserve
        end
      end

      module InstanceMethods
        def check_project_time_reserve
          return unless project.module_enabled?(:centosadmin_timing)
          
          if project.has_little_time? != project.time_reminder_sended
            unless project.time_reminder_sended
              CentosAdmin::TimeMailer.little_time(project).deliver
              project.update_attributes! time_reminder_sended: true
            end
          end
        end
      end
    end    
  end
end

TimeEntry.send :include, CentosAdmin::Patches::TimeEntryPatch
