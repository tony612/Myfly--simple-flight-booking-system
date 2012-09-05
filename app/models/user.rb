class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :phone, :username, :admin
  validates_presence_of :email, :phone, :username
  validates_presence_of :password, :on => :create
  validates_presence_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_length_of :password, :minimum => 4
  validates_confirmation_of :password

  has_many :orders, :inverse_of => :user
end
