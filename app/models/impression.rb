class Impression < ActiveRecord::Base
	has_many :pictures
	accepts_nested_attributes_for :pictures
	belongs_to :admin
end
