class Public::CommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      flash[:notice] = "成功しました"
      redirect_to post_path(comment.post)
    else
      redirect_to post_path(comment.post)
      flash[:notice]="失敗しました"
    end
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
