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
      newchunk = Newchunk.create(title: params[:title], text: params[:text],video_link: params[:video_link],image_link: params[:image_link], sound_link: params[:sound_link], oldchunk_id: params[:oldchunk_id])
      newchunk.user_id = current_user.id
      newchunk.save
       oldchunk = Oldchunk.find_by_id(newchunk.oldchunk_id)
        
        project = Project.find_by_id(oldchunk.project_id)
        redirect to "/#{project.pslug}/#{oldchunk.oslug}/index"
      
    end
  end
# /newchunks/oldchunk-#{oldchunk.id} this is a route to the display all scenes page?


  post '/projects' do
    project = Project.create(title: params[:title])
    project.save
    redirect("#{project.pslug}/oldchunk/new")
  end


  get '/:pslug/:oslug/index' do
    @project = Project.find_by_pslug(params[:pslug])
    @oldchunk = Oldchunk.find_by_oslug(params[:oslug])
    @newchunks = Newchunk.where("oldchunk_id = ?", @oldchunk.id)
    @vote_counts = Like.group(:newchunk_id).count
    erb :'newchunks/newchunks'
  end

  get '/:pslug/:oslug/create' do
    @project = Project.find_by_pslug(params[:pslug])
    @oldchunks = Oldchunk.where("project_id = ?", @project.id)
    @oldchunk = Oldchunk.find_by_oslug(params[:oslug])
    erb :'newchunks/create_newchunk'
  end

  
  get '/newchunks/:id/edit' do
    @newchunk = Newchunk.find_by_id(params[:id])
    if @newchunk.user_id == current_user.id
     oldchunk = Oldchunk.find_by_id(@newchunk.oldchunk_id)
      @project = Project.find_by_id(oldchunk.project_id)
    erb :'newchunks/edit_newchunk'
    else
    erb :'newchunks/show_newchunk'
    end
  end

  get '/newchunks/:id/show' do
    @newchunk = Newchunk.find_by_id(params[:id])
    puts "@newchunk: #{@newchunk}"
    @oldchunk = Oldchunk.find_by_id(@newchunk.oldchunk_id)
    puts "@oldchunk.id: #{@oldchunk.id}"
    @project = Project.find_by_id(@oldchunk.project_id)
    puts "@project: #{@project}"
    @vote_counts = Like.group(:newchunk_id).count
    puts "@vote_counts: #{@vote_counts}"
    @comments = Comment.where("newchunk_id =?", @newchunk.id)
    puts "@comments: #{@comments}"
    @newchunk_author = User.find_by_id(@newchunk.user_id)
    puts "@newchunk_author: #{@newchunk_author}"
    total_oldchunks_current_project = Oldchunk.where("project_id =?", @project.id).count
    puts "total_oldchunks_current_project: #{total_oldchunks_current_project}" 

     current_user_likes = Like.where("user_id =?", current_user.id)
     puts "current_user_likes: #{current_user_likes}" 
     current_user_likes.each {|like| puts "like.id #{like.id}"}
      votes_on_this_project = current_user_likes.select {|like| like.newchunk.oldchunk.project == @project}.count

      @remaining_votes = total_oldchunks_current_project - votes_on_this_project

    
    erb :'newchunks/show_newchunk'

  end
  
  post '/newchunks/comment' do
    if params[:comment] == "" && params[:vote] == nil
      redirect to "/newchunks/#{params[:id]}/show"
    else
      puts params
      if params[:comment] != ""
        comment = Comment.create(text: params[:comment], newchunk_id: params[:id], user_id: current_user.id)
        comment.save
      end
      if params[:vote] != nil
        like = Like.create(user_id: current_user.id, newchunk_id: params[:id])
        like.save 
      end
      redirect to "/newchunks/#{params[:id]}/show"
    end
  end
  

  patch '/newchunks/:id' do
    if params[:text] == ""
      redirect to "/newchunks/#{params[:id]}/edit"
    else
      @newchunk = Newchunk.find_by_id(params[:id])
      @newchunk.text = params[:text]
      @newchunk.title = params[:title]
      @newchunk.image_link = params[:image_link]
      @newchunk.sound_link = params[:sound_link]
      @newchunk.video_link = params[:video_link]
      @newchunk.save

      redirect to "/newchunks/#{@newchunk.id}/show"
    end
  end

  delete '/newchunks/:id/delete' do
    newchunk = Newchunk.find_by_id(params[:id]) 
        oldchunk = Oldchunk.find_by_id(newchunk.oldchunk_id)
        newchunk.delete
        project = Project.find_by_id(oldchunk.project_id)
        redirect to "/#{project.pslug}/#{oldchunk.oslug}/index"
      end

      post '/comments' do

      end


end