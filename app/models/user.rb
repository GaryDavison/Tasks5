class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :todos
	has_many :role_users
	has_many :roles, :through => :role_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
