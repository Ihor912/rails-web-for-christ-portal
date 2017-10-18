class Article < ApplicationRecord
	belongs_to :category
	validates :title, presence: true, length: { minimum: 5, maximum: 50 }
	validates :body, presence: true, length: { minimum: 50, maximum: 1000 }

	scope :is_moderated, -> { where(moderated: true) }
	scope :most_popular, -> { self.order("views DESC").limit(5) }
end
