class AddTimeReserveToProject < ActiveRecord::Migration
  def change
    add_column :projects, :time_reserve, :float, default: 0.0, null: false
  end
end
