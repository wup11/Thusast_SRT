class Project < ActiveRecord::Base
  attr_accessible :author1, :author2, :author3, :author4, :department, :name, :prize, :professor, :status, :user_id
  has_one :user
end
