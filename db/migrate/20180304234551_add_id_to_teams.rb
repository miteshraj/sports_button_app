class AddIdToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :id, :integer
  end
end
