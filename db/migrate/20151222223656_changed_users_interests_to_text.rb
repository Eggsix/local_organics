class ChangedUsersInterestsToText < ActiveRecord::Migration
  def change
  	change_column :users, :interest, :text
  end
end
