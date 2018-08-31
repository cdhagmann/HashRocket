class Post < ActiveRecord::Base
  has_many :upvotes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  def score
    upvotes.count
  end
end