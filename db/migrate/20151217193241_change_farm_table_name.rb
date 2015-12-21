class ChangeFarmTableName < ActiveRecord::Migration
  def change
  	rename_table :farms, :locations
  end
end
