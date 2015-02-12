class Message < ActiveRecord::Base
	# belongs_to :to, class_name: 'User'
	belongs_to :user
	belongs_to :to, class_name: 'User'
end
