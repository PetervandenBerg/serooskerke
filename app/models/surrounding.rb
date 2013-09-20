class Surrounding < ActiveRecord::Base
	has_many :photos
	accepts_nested_attributes_for :photos
	belongs_to :admin
end
