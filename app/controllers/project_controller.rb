class ProjectController < ApplicationController

  get '/projects' do
    @projects = Project.all
    erb :'projects/projects_index'
  end

  # when someone has logged in , they land on the "projects index" page that right now, only shows Juliet is the Sun, but will include other pjcts., and this happens, sending them finally to JITS index
  get '/:pslug/index' do
    @project = Project.find_by_pslug(params[:pslug])
    @oldchunks = Oldchunk.where("project_id = ?", @project.id)
    @users = User.where("project_id =?", @project.id)
  erb :'oldchunks/oldchunks'
  end

  get '/projects/new' do
    erb :'projects/create_project'
  end

  post '/projects' do
    project = Project.create(params)
    project.save
    redirect("#{project.slug}/oldchunk/new")
  end

end