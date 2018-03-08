class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :abv_code
      t.string :location
      t.string :logo_image

      t.timestamps
    end
  end
end
