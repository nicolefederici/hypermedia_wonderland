require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "zounds"
  end

   helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

  # when someone has logged in , they land on the "projects index" page that right now, only shows Juliet is the Sun, but will include other pjcts., and this happens, sending them finally to JITS index
  get 'projects/:pslug/index' do
    project = Project.find_by_slug(params[:pslug])
    @oldchunks = OldChunk.where("project_id = ?", project.id)
  erb :index
  end

  
  
end