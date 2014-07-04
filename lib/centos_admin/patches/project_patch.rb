require_dependency 'project'


# Patches Redmine's Project dynamically.
module CentosAdmin
  module Patches
    module ProjectPatch
      def self.included(base) # :nodoc
        # Same as typing in the class
        base.class_eval do

        end
      end
    end
  end
end


# Add module to Project
Project.send(:include, ProjectPatch)
Project.safe_attributes 'time_reserve'