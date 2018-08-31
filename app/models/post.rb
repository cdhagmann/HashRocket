class Post < ActiveRecord::Base
  has_many :upvotes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def score
    upvotes.count
  end
end