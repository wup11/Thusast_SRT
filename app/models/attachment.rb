class Attachment < ActiveRecord::Base
  attr_accessible :filename, :user_id
  belongs_to :user
end
