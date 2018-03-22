class TeamsController < ApplicationController
	#def index
	#	teams = Team.all 
	#	render json: teams.as_json
	#end

	def index
	  response = Unirest.get("https://api.fantasydata.net/v3/nba/scores/JSON/GamesByDate/2018-MAR-21?key=e04aba8cea684b27a5e404d38c8f8401")
	  render json: response.body
	end

	def show
		date = params[:id]
		response = Unirest.get("https://api.fantasydata.net/v3/nba/scores/JSON/GamesByDate/2018-MAR-20?key=e04aba8cea684b27a5e404d38c8f8401")
		render json: response.as_json
	end

end
