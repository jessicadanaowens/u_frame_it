require "sinatra"
require "rack-flash"
require "./lib/user_database"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @user_database = UserDatabase.new
  end

  get '/' do
    erb :home
  end

  post '/' do
    session.delete(:user_id)
    flash[:notice] = "You are signed out."
    erb :home
  end

  post "/sessions" do
    session[:user_id] = 1
    redirect "/signed_in"
  end

  get "/signed_in" do

    erb :signed_in
  end

  get "/register" do
    username = params[:registername]

    erb :register, :locals=>{:username=>username}
  end

end