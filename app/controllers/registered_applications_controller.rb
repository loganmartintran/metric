class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @apps = RegisteredApplication.all
  end

  def new
    @app = RegisteredApplication.new
  end

  def create
    @app = RegisteredApplication.new
    @app.name = params[:app][:name]
    @app.url = params[:app][:url]
    @app.user = current_user

    if @app.save
      flash[:notice] = "Your application has been registered!"
      redirect_to @app
    else
      flash[:alert] = "There was an error registering your application. Please try again."
      render :new
    end
  end

  def edit
    @app = RegisteredApplication.find(params[:id])
  end

  def update
    @app = RegisteredApplication.find(params[:id])
    @app.name = params[:app][:name]
    @app.url = params[:app][:url]

    if @app.save
      flash[:notice] = "Your application has been updated."
      redirect_to @app
    else
      flash[:alert] = "There was an error updating your application. Please try again."
      render :edit
    end
  end

  def destroy
    @app = RegisteredApplication.find(params[:id])

    if @app.delete
      flash[:notice] = "Your application was successfully deleted"
      redirect_to registered_applications_path
    else
      flash[:alert] = "There was an error deleting your application. Please try again."
      redirect_to @app
    end
  end

  def show
    @app = RegisteredApplication.find(params[:id])
  end

end
