class NewChunkController < ApplicationController

get '/newchunks' do
    if logged_in?
      @newchunks = Newchunk.all
      erb :'newchunks/?????tweets'
    else
      redirect to '/login'
    end
  end

  get '/newchunks/new' do
    if logged_in?
      erb :'newchunks/create_newchunk'
    else 
      redirect to '/login'
    end
  end

  post '/newchunks' do
    if params[:content] == ""
      redirect to "/tweets/new"
    else
      current_user.tweets.create(content: params[:content])
      redirect "/tweets"
    end
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'tweets/show_tweet'
    else 
      redirect to '/login'
    end
  end

  get '/tweets/:id/edit' do
    if logged_in? 
      @tweet = Tweet.find_by_id(params[:id])
      if @tweet.user_id == current_user.id
        erb :'tweets/edit_tweet'
      else 
        redirect to '/tweets'
      end
    else 
      redirect to '/login'
    end
  end

  patch '/tweets/:id' do
    if params[:content] == ""
      redirect to "/tweets/#{params[:id]}/edit"
    else
      @tweet = Tweet.find_by_id(params[:id])
      @tweet.content = params[:content]
      @tweet.save
      redirect to "/tweets/#{@tweet.id}"
    end
  end

  delete '/tweets/:id/delete' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      if @tweet.user_id == current_user.id 
        @tweet.delete
        redirect to '/tweets'
      else 
        redirect to '/tweets'
      end
    else 
      redirect to '/login'
    end
  end





end