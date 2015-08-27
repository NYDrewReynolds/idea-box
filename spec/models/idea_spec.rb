require 'rails_helper'

RSpec.describe Idea, type: :model do

  it "must have a title" do
    idea = Idea.new(body: 'test')
    idea.save
    expect(idea).to_not be_valid
  end

  it "title must be unique" do
    idea = Idea.new(title: 'woo!', body: 'test')
    idea.save
    idea_two = Idea.new(title: 'woo!', body: 'hello')
    expect(idea).to be_valid
    expect(idea_two).to_not be_valid
  end

  it "must have a body" do
    idea = Idea.new(title: 'test')
    idea.save
    expect(idea).to_not be_valid
  end

  it "assigns 'swill' as default quality" do
    idea = Idea.new(title: 'test', body:'woo!')
    idea.save
    expect(idea).to be_valid
    expect(idea.quality).to eq('swill')
  end

  it "can be upvoted" do
    idea = Idea.new(title: 'test', body:'woo!')
    idea.save
    expect(idea).to be_valid
    expect(idea.quality).to eq('swill')
    idea.upvote
    expect(idea.quality).to eq('plausible')
    idea.upvote
    expect(idea.quality).to eq('genius')
  end

  it "can be downvoted" do
    idea = Idea.new(title: 'test', body:'woo!')
    idea.save
    expect(idea).to be_valid
    expect(idea.quality).to eq('swill')
    idea.upvote
    idea.upvote
    expect(idea.quality).to eq('genius')
    idea.downvote
    expect(idea.quality).to eq('plausible')
    idea.downvote
    expect(idea.quality).to eq('swill')
  end

  it 'swill cant be downvoted' do
    idea = Idea.new(title: 'test', body:'woo!')
    idea.save
    expect(idea.quality).to eq('swill')
    expect(idea).to be_valid
    idea.downvote
    expect(idea.quality).to eq('swill')
  end

  it 'genius cant be upvoted' do
    idea = Idea.new(title: 'test', body:'woo!')
    idea.save
    expect(idea.quality).to eq('swill')
    expect(idea).to be_valid
    idea.upvote
    idea.upvote
    expect(idea.quality).to eq('genius')
    idea.upvote
    expect(idea.quality).to eq('genius')
  end
end
