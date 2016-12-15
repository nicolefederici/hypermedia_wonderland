class OldchunkController < ApplicationController

  get "/:pslug/oldchunk/new" do
    @project = Project.find_by_pslug(params[:pslug])
    erb :"oldchunks/create_oldchunk"
  end
    

#see below for the page you enter your "script", scene by scene into.
#once you enter one scene, it take you back to the scene entry page automatically, which is 
#/oldchunks/new, so you can do it to the whole work without clicking back. If you want to see the 
#whole list of scenes, that is at this route: oldchunks/oldchunks

  post "/oldchunks" do
    old = Oldchunk.create(title: params[:title], text: params[:text], project_id: params[:project_id])
    old.save
    project = Project.find_by_id(old.project_id)
    redirect to "/#{project.pslug}/oldchunk/new"
  end


  delete '/oldchunks/:id/delete' do
    oldchunk = Oldchunk.find_by_id(params[:id]) 
    newchunks = Newchunk.where("oldchunk_id = ?",oldchunk.id)
    project = Project.find_by_id(oldchunk.project_id)
    if newchunks != nil
      newchunks.each do |newchunk|
        newchunk.delete
      end
    end 
    oldchunk.delete        
    redirect to "/#{project.pslug}/index"
  end

# post '/comments' do

# end

end