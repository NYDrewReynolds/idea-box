class IdeasController < ApplicationController
  before_action :set_ideas, only: [:index, :create]

  def index
    @idea = Idea.new
  end

  def create
    idea = Idea.new(idea_params)
    idea.quality = "swill"
    idea.save
    render partial: "shared/idea", locals: {idea: idea}
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    respond_to do |format|
      format.js { render nothing: true }
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:body, :title)
  end

  def set_ideas
    @ideas = Idea.all
  end

end
