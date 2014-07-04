class AddTimeReserveToProject < ActiveRecord::Migration
  def change
    add_column :projects, :time_reserve, :float
  end
end
