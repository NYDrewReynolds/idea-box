class IdeasController < ApplicationController
  before_action :set_ideas, only: [:index, :create]

  def create
    idea = Idea.new(idea_params)
    idea.quality = "swill"
    idea.save
    render partial: "shared/idea", locals: {idea: idea}
  end

  private

  def idea_params
    params.require(:idea).permit(:body, :title)
  end

  def set_ideas
    @ideas = Idea.all
    @idea = Idea.new
  end

end
