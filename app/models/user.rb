class User < ApplicationRecord
    has_secure_password
    # has_many :votes
    # has_many :comments
    # has_many :post
    validates :username, presence: true, uniqueness: true
   
end
