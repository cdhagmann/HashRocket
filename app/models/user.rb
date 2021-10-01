# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :upvotes
  has_many :comments
  has_many :posts
  validates :username, presence: true, uniqueness: true
end
