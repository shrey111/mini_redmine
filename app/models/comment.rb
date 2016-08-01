class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :content, length: {maximum: 50}
end
