require 'sinatra/base'

class FrameApp < Sinatra::Base

  get '/' do
    erb :login_register
  end





end