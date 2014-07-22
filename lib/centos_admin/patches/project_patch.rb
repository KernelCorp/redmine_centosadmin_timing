require_dependency 'project'

module CentosAdmin
  module Patches
    module ProjectPatch
      def self.included(base)
        base.send :include, InstanceMethods
      end

      module InstanceMethods
        def managers
          managers_roles = Setting.plugin_centosadmin_redmine_plugin['managers_roles']

          members.select do |member|
            member.roles.any? do |role|
              managers_roles.include? role.name
            end
          end
        end

        def has_little_time?
          time_reserve != 0 && time_remain < 2.0
        end

        def time_remain
          time_reserve - time_entries.sum(:hours)
        end
      end
    end    
  end
end

Project.send :include, CentosAdmin::Patches::ProjectPatch
Project.safe_attributes :time_reserve, :time_reminder_sended
