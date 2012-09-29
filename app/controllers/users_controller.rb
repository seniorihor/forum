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
    user.sign_up
  end

  def login
    user = User.where(login: params[:login]).first
    if user.nil? || user.password != params[:password]
      redirect_to '/users/sign_in'
    else
      session[:login] = user.login
      puts "SESSION: #{session}"*100
      redirect_to "/user/#{user.login}"
    end
  end

  def logout
    if session[:login].nil?
      redirect_to '/sign_in'
    else
      session[:login] = nil
      redirect_to '/users'
    end
  end

  def edit
    @user = User.where(login: params[:id]).first
    puts "SESSION: #{session}"*100
  end

  def show
    @user = User.where(login: params[:login]).first
  end

  def update
    puts "SESSION: #{session}"*100
    user = User.where(login: session[:login]).first
    user.firstname = params[:firstname]
    user.lastname  = params[:lastname]
    user.password  = params[:password]
    user.save
  end

  def destroy
  end
end
