class Ticket < ActiveRecord::Base
	belongs_to :user
 # belongs_to :assignee , :class_name => 'assignee_gtickets'
  belongs_to :project
  has_many :comments, as: :commentable
  has_and_belongs_to_many :watchers ,join_table: 'ntickets_watchers' , :class_name => 'User'

  accepts_nested_attributes_for :comments
  validates :status ,presence: true, length: {maximum: 20}
  validates :user_id, presence: true 
  validates :title ,presence: true,length: {minimum: 5,maximum:20}
  validates :priority, :tracker ,:project_id ,presence: true
  validates :description ,presence: true ,length: {minimum: 5,maximum:100}

  PRIORITIES = ['Prod Blocker','Immediate','High' ,'Medium' ,'Low']
  STATUS = ['New' , 'In Progress' ,'Resolved' ,'Closed', 'Rejected']
  TRACKER = ['Bug' , 'Feature' ,'Task' ,'Support']
end
