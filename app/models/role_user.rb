class Role_user < ActiveRecord::Base
	belongs to :user
	belongs to :role
end

