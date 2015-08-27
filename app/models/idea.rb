class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true


  def upvote
    if quality == "swill"
      update_attribute(:quality, "plausible")
    elsif quality == "plausible"
      update_attribute(:quality, "genius")
    end
  end

  def downvote
    if quality == "genius"
      update_attribute(:quality, "plausible")
    elsif quality == "plausible"
      update_attribute(:quality, "swill")
    end
  end
end
