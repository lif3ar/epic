class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :directions
  belongs_to :user

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  
  validates :title, :description, presence: true
  
  has_attached_file :avatar, styles: { small: "200x200>", medium: "500x500>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end