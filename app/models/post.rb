class Post < ApplicationRecord
    has_one_attached :pronunciation
    belongs_to :user

end
