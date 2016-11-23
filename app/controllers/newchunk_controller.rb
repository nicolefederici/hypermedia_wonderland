class NewchunkController < ApplicationController

# get '/newchunks' do
#     if logged_in?
#       @newchunks = Newchunk.all
#       erb :'newchunks/--------'
#     else
#       redirect to '/login'
#     end
#   end

  # get '/newchunks/new' do
  #   if logged_in?
  #     erb :'newchunks/create_newchunk'
  #   else 
  #     redirect to '/login'
  #   end
  # end

  post '/newchunks' do
    if params[:text] == ""
      redirect to "/newchunks/create_newchunk"
    else
      newchunk = Newchunk.create(params)
      newchunk.user_id = current_user.id
      newchunk.save
       oldchunk = Oldchunk.find_by_id(newchunk.oldchunk_id)
        
        project = Project.find_by_id(oldchunk.project_id)
        redirect to "/#{project.pslug}/#{oldchunk.oslug}/index"
      
    end
  end
# /newchunks/oldchunk-#{oldchunk.id} this is a route to the display all scenes page?


  post '/projects' do
    project = Project.create(params)
    project.save
    redirect("#{project.pslug}/oldchunk/new")
  end


  get '/:pslug/:oslug/index' do
    @project = Project.find_by_pslug(params[:pslug])
    @oldchunk = Oldchunk.find_by_oslug(params[:oslug])
    @newchunks = Newchunk.where("oldchunk_id = ?", @oldchunk.id)
    erb :'newchunks/newchunks'
  end

  get '/:pslug/:oslug/create' do
    @project = Project.find_by_pslug(params[:pslug])
    @oldchunks = Oldchunk.where("project_id = ?", @project.id)
    @oldchunk = @oldchunks.first #fix this bullshit
    erb :'newchunks/create_newchunk'
  end

  
  get '/newchunks/:id/edit' do
    @newchunk = Newchunk.find_by_id(params[:id])
     oldchunk = Oldchunk.find_by_id(@newchunk.oldchunk_id)
        @project = Project.find_by_id(oldchunk.project_id)
    erb :'newchunks/edit_newchunk'
  end

  patch '/newchunks' do
    if params[:content] == ""
      redirect to "/newchunks/#{params[:id]}/edit"
    else
      @newchunk = Newchunk.find_by_id(params[:id])
      @newchunk.content = params[:content]
      @newchunk.save
      redirect to "/newchunks/#{@newchunk.id}"
    end
  end

  delete '/newchunks/:id/delete' do
    newchunk = Newchunk.find_by_id(params[:id]) 
        oldchunk = Oldchunk.find_by_id(newchunk.oldchunk_id)
        newchunk.delete
        project = Project.find_by_id(oldchunk.project_id)
        redirect to "/#{project.pslug}/#{oldchunk.oslug}/index"
      end





end