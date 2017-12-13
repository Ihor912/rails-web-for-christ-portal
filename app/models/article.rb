class Article < ApplicationRecord
	include PgSearch
	mount_uploader :image, ImageUploader
	pg_search_scope :full_text_search,
					:against => [:title, :body],
					:using => {
						:tsearch => {:prefix => true}
					}
	belongs_to :user
	has_and_belongs_to_many :tags
	
	validates :title, presence: true, length: { minimum: 5, maximum: 50 }
	validates :body, presence: true, length: { minimum: 50, maximum: 10000 }
	validates :link_name, presence: true, length: { maximum: 25 }, uniqueness: true

	scope :most_popular, -> { self.order("views DESC").limit(4) }
end
