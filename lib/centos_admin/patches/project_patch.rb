require_dependency 'project'

# Patches Redmine's Project dynamically.
module CentosAdmin
  module Patches
    module ProjectPatch
      def self.included(base) # :nodoc
        base.send(:include, InstanceMethods)

        base.class_eval do

        end
      end
    end

    module InstanceMethods
      def has_little_time?
        #TODO check time reserve
      end
    end
  end
end

Project.send(:include, ProjectPatch)
Project.safe_attributes 'time_reserve'