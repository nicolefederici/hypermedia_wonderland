class ProjectController < ApplicationController

  get '/projects' do
    @projects = Project.all
    erb :'projects/projects_index'
  end

  # when someone has logged in , they land on the "projects index" and this happens, sending them finally to JITS index
  get '/:pslug/index' do
    @project = Project.find_by_pslug(params[:pslug])
    @oldchunks = Oldchunk.where("project_id = ?", @project.id)
    @users = User.where("project_id =?", @project.id)
    erb :'oldchunks/oldchunks'
  end

  get '/:pslug/final_map' do
    @highest_votes = []
    @project = Project.find_by_pslug(params[:pslug])
    @oldchunks = Oldchunk.where("project_id = ?", @project.id)
    
    @oldchunks.each do |oldchunk|
      # puts oldchunk.title
      newchunks = Newchunk.where("oldchunk_id = ?", oldchunk.id)
      # puts newchunks
      if newchunks.size == 0
        @highest_votes << Newchunk.new(title: "there is no vote data for this section")
        puts "there isn't any data for this section yet."
      else
        likes_array = newchunks.collect do | newchunk|
          Like.where("newchunk_id = ?", newchunk.id).size
        end
        @highest_votes << newchunks[likes_array.each_with_index.max[1]]
      end
    end
    erb :'final_map'
  end

  get '/projects/new' do
    erb :'projects/create_project'
  end

  post '/projects' do
    project = Project.create(title: params[:title])
    project.save
    redirect("#{project.pslug}/oldchunk/new")
  end

end