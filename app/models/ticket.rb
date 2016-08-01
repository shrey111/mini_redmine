class Ticket < ActiveRecord::Base
	belongs_to :user
  belongs_to :project
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments
  validates :status ,presence: true, length: {maximum: 20}
  validates :user_id, presence: true 
  validates :title ,presence: true,length: {minimum: 5,maximum:20}
  validates :priority, :type ,:project_id ,presence: true
  validates :description ,presence: true ,length: {minimum: 5,maximum:100}

  PRIORITIES = ['High' ,'Medium' ,'Low']
  STATUS = ['DONE','NOT STARTED', 'INCOMPLETE']
end
