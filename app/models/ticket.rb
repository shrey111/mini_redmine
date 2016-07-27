class Ticket < ActiveRecord::Base
	belongs_to :user
  belongs_to :project
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments
  PRIORITIES = ['im']
end
