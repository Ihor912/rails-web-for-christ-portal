class Tag < ApplicationRecord
	has_and_belongs_to_many :articles

	validates :name, presence: true, length: { minimum: 3, maximum: 30 }
	validates :link_name, presence: true, length: { maximum: 25 }, uniqueness: true

end
