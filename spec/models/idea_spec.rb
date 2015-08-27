require 'rails_helper'

RSpec.describe Idea, type: :model do

  context "when it has invalid attributes" do

    xit "raises an execption when hard saving" do
      article.title = nil
      expect { article.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  xit "must have a unique title" do
    article.save
    second = article.dup
    expect(second).to_not be_valid
  end

  xit "returns the title when converted to a string" do
    expect(article.to_s).to eq article.title
  end

  xit "responds to comments" do
    expect(article).to respond_to(:comments)
  end

  xit "responds to .valid_ids with a set of all current article IDs" do
    expect(Article.valid_ids).to eq Article.select(:id).collect { |a| a.id }
  end

  context ".for_dashboard" do
    xit "gives the most recent 5 articles" do
      6.times do
        Fabricate(:article)
      end
      expected = Article.order('created_at DESC').limit(5).all
      articles = Article.for_dashboard
      expect(articles.count).to eq(5)
      expect(articles).to eq(expected)
    end
  end

  context ".total_word_count" do
    xit "gives the word count for all articles" do
      2.times { Fabricate(:article, :body => "I think that...") }

      expect(Article.total_word_count).to eq(6)
    end
  end

  context "#word_count" do
    xit "gives the total number of words" do
      article = Fabricate(:article, :body => "Four score and seven years ago...")
      expect(article.word_count).to eq(6)
    end
  end

  context ".most_popular" do
    xit "returns the article with the most comments" do
      articles = (0..5).collect { Fabricate(:article) }
      Comment.destroy_all
      target = articles[rand(articles.length)]
      Fabricate(:comment, :article => target)
      expect(Article.most_popular).to eq target
    end
  end

  context ".search_by_tag_name" do
    context "when given no parameter" do
      xit "should return all the articles" do
        articles, tag = Article.search_by_tag_name(nil)
        expect(articles).to eq Article.all
      end
    end

    context "when given a tag name" do
      context "and the tag exists" do
        xit "should return the articles associated with that tag and the tag" do
          tag = Fabricate(:tag)
          tag.articles = [Fabricate(:article), Fabricate(:article)]
          expect(Article.search_by_tag_name(tag.name)).to eq [tag.articles, tag]
        end
      end

      context "but the tag does not exist" do
        xit "should return an empty list of articles and no tag" do
          bad_name = Fabricate(:tag).name + "_no_exist"
          expect(Article.search_by_tag_name(bad_name)).to eq [[], nil]
        end
      end
    end
  end
end




