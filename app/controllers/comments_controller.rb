class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: params[:text], tweet_id: params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{@create.tweet.id}"
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comment.includes(:user)
  end

  private
  def comment_params
    params.permit(:text, :tweet_id)
    
  end
end
