class Post < ApplicationRecord
    has_one_attached :pronunciation
    belongs_to :user
    has_many :comments
    has_and_belongs_to_many :tags
end
