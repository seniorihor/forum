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

  def sign_in
  end

  def login
    user = User.where(login: params[:login]).first
    if user.nil? || user.password != params[:password]
      redirect_to '/users/sign_in'
    else
      session[:login] = user.login
      redirect_to '/users'
    end
  end

  def logout
    if session[:login].nil?
      redirect_to '/users/sign_in'
    else
      session[:login] = nil
      redirect_to '/users'
    end
  end

#  def new
#  end

  def edit
  end

  def show
    if session[:login].nil?
      redirect_to '/pusta_sesiya'
    else
      redirect_to '/www'
    end
  end

  def update
  end

  def destroy
  end
end
