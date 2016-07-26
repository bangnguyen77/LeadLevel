
require("bundler/setup")
require("bcrypt")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/create/user') do
  erb(:sign_up)
end

post("/create/user") do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  user_name = params.fetch("user_name")
  password = params.fetch("password")
  user = User.create({:user_name => user_name, :first_name => first_name, :last_name => last_name, :password => password})
  redirect to("/")
end
