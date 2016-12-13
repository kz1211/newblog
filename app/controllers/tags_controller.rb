class TagsController < ApplicationController
  def index
   @tags = Tag.all
  end
  def show
     @tag = Tag.find params[:id]
  end

  def create
    @tag = Post.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def tag_params
      params.require(:tag).permit(:name)
    end
 end
