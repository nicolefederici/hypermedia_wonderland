class ProjectController < ApplicationController

  get '/projects' do
    @projects = Project.all
    erb :'projects/projects_index'
  end

end