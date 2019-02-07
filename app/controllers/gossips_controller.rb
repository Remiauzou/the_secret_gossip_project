class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = @gossip.user
    @comments = @gossip.comments
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: User.all.sample.id)

      if @gossip.save
        redirect_to root_path, :notice => "Info dévoilée!"

      else
        render 'new'
      end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.permit(:title, :content)

      if @gossip.update(gossip_params)
        redirect_to @gossip, :notice => "Info mise à jour"

      else
        render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
end 
