class Direction < ActiveRecord::Base
  belongs_to :recipe
  
  validates :step, presence: true
end
