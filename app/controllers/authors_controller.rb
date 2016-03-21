class AuthorsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Successfully Created Author"
      redirect_to authors_path
    else
      flash.now[:error] = "Error Creating Author"
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
    redirect_to author_path(@author), notice: "Successfully Updated"
    else
    flash.now[:error] = "Error upating author"
    render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path, notice: "Successfully Delete Author"
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

end
