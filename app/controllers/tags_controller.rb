class TagsController < ApplicationController
    before_action :authenticate_user!, :except => [:show, :index]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Successfully Created Tag"
      redirect_to tags_path
    else
      flash.now[:error] = "Error Creating Tag"
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
    redirect_to tag_path(@tag), notice: "Successfully Updated"
    else
    flash.now[:error] = "Error upating tag"
    render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path, notice: "Successfully Delete Tag"
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end


end
