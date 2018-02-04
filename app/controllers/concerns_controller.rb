class ConcernsController < ApplicationController
  def index
    @concerns = Concern.all
    @concern = Concern.new
  end

  def show
    @concern = Concern.find(params[:id])
  end
  
  def upvote 
    # @user = current_user
    @concern = Concern.find(params[:id])
    if current_user.voted_for? @concern 
      @concern.unvote_by current_user
    else
      @concern.upvote_by current_user
    end
    redirect_back(fallback_location: root_path)
    
    
  end  
  
  def create
    @concern = Concern.new(concern_params)
    if @concern.save
        redirect_to "/concerns", alert: "Your concern has been submitted! It will be visible after its been reviewed by a moderator. Check back soon!"
    else
        redirect_to "/concerns", alert: "An error occurred while submitting your concern."
    end
  end
  
  def concern_params
    params.require(:concern).permit(:title)
  end
end