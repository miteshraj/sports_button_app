class RemoveIdFromTeams < ActiveRecord::Migration[5.1]
  def change
  	remove_column :teams, :id, :integer
  end
end
