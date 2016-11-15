class ProjectController < ApplicationController

  get '/projects' do
    @projects = Project.all
    erb :'projects/projects_index'
  end

  # when someone has logged in , they land on the "projects index" page that right now, only shows Juliet is the Sun, but will include other pjcts., and this happens, sending them finally to JITS index
  get 'projects/:pslug/index' do
    project = Project.find_by_slug(params[:pslug])
    @oldchunks = OldChunk.where("project_id = ?", project.id)
    @users = User.where("project_id =?", project.id)
  erb :'oldchunks/oldchunks'
  end

  get '/projects/new' do
    erb :'projects/create_project'
  end

  post '/projects' do
    project = Project.create(params)
    project.save
    redirect("projects/#{project.pslug}/index")
  end

end