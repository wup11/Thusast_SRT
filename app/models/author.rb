class Author < ActiveRecord::Base
  attr_accessible :authorname, :class_name, :credit, :department, :grade, :mail, :phone, :project_id, :stunum, :user_id
  belongs_to :user
  belongs_to :project
end
