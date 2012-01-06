class PostVotesController < ApplicationController
  before_filter :privileged_only
  
  def create
    @post = Post.find(params[:post_id])
    @post.vote!(params[:score])
  rescue PostVote::Error => x
    @error = x
  end
end
