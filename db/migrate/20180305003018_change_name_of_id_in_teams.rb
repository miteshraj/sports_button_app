class ChangeNameOfIdInTeams < ActiveRecord::Migration[5.1]
  def change
  	rename_column :teams, :id, :team_id
  end
end
