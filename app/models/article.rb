class Article < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_and_belongs_to_many :tags
	
	validates :title, presence: true, length: { minimum: 5, maximum: 50 }
	validates :body, presence: true, length: { minimum: 50, maximum: 10000 }
	validates :link_name, presence: true, length: { maximum: 25 }, uniqueness: true

	scope :most_popular, -> { self.order("views DESC").limit(4) }
end
