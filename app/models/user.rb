class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable ,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  validates :name,:email ,:password , :password_confirmation ,presence: true 
 validates_presence_of :email, :password
 validates_format_of :email,:with => Devise::email_regexp
 #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
   validates_presence_of :email, :case_sensitive => false, :allow_blank => false

  has_and_belongs_to_many :projects
  has_many :tickets
  has_many :comments
end
