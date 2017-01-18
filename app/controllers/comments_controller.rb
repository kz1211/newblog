class CommentsController < ApplicationController

  def new
    @comment = post.comments.new
  end

  def create
    @comment = post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

    def post
      @post ||= Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment)
        .permit(:text)
        .merge(user_id: current_user.id)
    end
end
