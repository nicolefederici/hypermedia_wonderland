class UserController < ApplicationController

  


  get '/signup' do
    if !logged_in?
     erb :'users/create_user', locals: {message: 'Please sign up before you sign in'}
    else
    redirect to '/projects'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == "" 
      redirect to '/signup'
    elsif !!User.find_by(username: params[:username])
      session[:username_taken] = true
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save 
      session[:user_id] = @user.id
      redirect to '/projects'
    end
  end


  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/projects'
    end
  end

   post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
     
      session[:user_id] = user.id
      redirect '/projects'
    else 
      redirect to '/signup'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end


  get '/logout' do
    if logged_in? 
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end





end