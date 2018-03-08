require "unirest"

puts "Welcome to the Sports Button app! Select an option:"
puts "[1] to Sign up"
puts "[2] to Login"
puts "[3] Show all teams"
puts "[4] to Logout"
puts "5 to show a team"
puts "6 to create a new user"


#input_option = gets.chomp
#if input_option == "1"
 # response = Unirest.get("http://localhost:3000/teams")
  #teams = response.body
 # puts JSON.pretty_generate(teams)

input_option = gets.chomp

if input_option == "1"
    puts "Signup: "
    params = {}
    puts "First name: "
    params[:name] = gets.chomp
    puts "Email: "
    params[:email] = gets.chomp
    puts "Password: "
    params[:password] = gets.chomp
    puts "Password Confirmation: "
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("http://localhost:3000/users", parameters: params)
    puts JSON.pretty_generate(response.body)



elsif input_option == "2"
	puts "Login:"
	puts "User email: "
	input_email = gets.chomp
	puts "User password: "
	input_password = gets.chomp
	response = Unirest.post("http://localhost:3000/user_token", parameters: {auth: {email: input_email, password: input_password}})  
	# Save the JSON web token from the response
	jwt = response.body["jwt"]
	p jwt
	admin = response.body["admin"]
	p admin
	# Include the jwt in the headers of any future web requests
	Unirest.default_header("Authorization", "Bearer #{jwt}")
	

elsif input_option == "3"
  response = Unirest.get("http://localhost:3000/teams")
  teams = response.body
  puts JSON.pretty_generate(teams)

elsif input_option == "4"
	jwt = ""
	Unirest.clear_default_headers()
	puts "Logged out"

elsif input_option == "5"
	  print "Enter a contact id: "
	  input_id = gets.chomp

	  response = Unirest.get("http://localhost:3000/teams?#{input_id}")
	  contact = response.body#{input_id}
		puts JSON.pretty_generate(contact)


	elsif input_option == "6"
	  params = {}

	  puts "User email: "
	  params[:email] = gets.chomp
	  puts "Password: "
	  params[:password] = gets.chomp

	  response = Unirest.post("http://localhost:3000/users", parameters: params)
	  user = response.body
	  puts JSON.pretty_generate(user)
end