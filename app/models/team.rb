class Team < ApplicationRecord
	has_many :user_teams
	has_many :teams, through: :user_teams


	def as_json
	{
		name: name,
		abv_code: abv_code,
		location: location,
		logo_image: logo_image,
		team_id: team_id
		
	}
		
	end

end
