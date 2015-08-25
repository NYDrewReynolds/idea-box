class IdeasController < ApplicationController
  def new
    @idea = Idea.new
    @ideas = Idea.all
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.quality = "swill"
    if @idea.save
      flash[:notice] = "Idea successfully created!"
      render new_idea_path
    else
      flash[:notice] = "Idea was not created."
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:body, :title)
  end

end
