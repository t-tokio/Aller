class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit]

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
    #@comment = Comment.new
    #@comments = @tweet.comments.includes(:user)
  end

  def edit

  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end


  private

  def tweet_params
    params.require(:tweet).permit(:image, :title, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    redirect_to(root_path) unless @user == current_user
  end
end
