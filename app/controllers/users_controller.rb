class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    user = User.new
    user.login     = params[:login]
    user.password  = params[:password]
    user.firstname = params[:firstname]
    user.lastname  = params[:lastname]
    user.save
  end

  def new
  end

  def edit
    @user = User.where(login: params[:login]).first
  end

  def show
    @user = User.where(login: params[:login]).first
  end

  def sign_in
    redirect_to '/users' if session[:login]
  end

  def login
    user = User.where(login: params[:login]).first
    if user.nil? || user.password != params[:password]
      redirect_to '/sign_in'
    else
      session[:login] = user.login
      redirect_to "/users/#{user.login}"
    end
  end

  def logout
    if session[:login].nil?
      redirect_to '/sign_in'
    else
      #session[:login] = nil
      reset_session
      redirect_to '/users'
    end
  end

  def update
    # why session is empty???
    if user = User.where(login: session[:login]).first
      user.firstname = params[:firstname]
      user.lastname  = params[:lastname]
      user.password  = params[:password]
      user.save
      redirect_to '/users'
    else
      redirect_to '/sign_in'
    end
  end

  def destroy
    if user = User.where(login: session[:login]).first
      user.destroy!
      #session[:login] = nil
      reset_session
      redirect_to '/users'
    else
      redirect_to '/sign_in'
    end
  end
end
