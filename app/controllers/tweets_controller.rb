class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
   @tweets = Tweet.includes(:user)
  end

  def new
   @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path(@tweet)
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    #@comment = Comment.new
    #@comments = @tweet.comments.includes(:user)
  end


  private

  def tweet_params
    params.require(:tweet).permit(:image, :title, :text).merge(user_id: current_user.id)
  end
end
