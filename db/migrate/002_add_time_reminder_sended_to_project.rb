class AddTimeReminderSendedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :time_reminder_sended, :boolean, default: false, null: false
  end
end
