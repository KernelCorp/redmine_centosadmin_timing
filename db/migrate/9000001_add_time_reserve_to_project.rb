class AddTimeReserveToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :time_reserve, :float
  end

  def self.down
    remove_column :projects, :time_reserve
  end
end