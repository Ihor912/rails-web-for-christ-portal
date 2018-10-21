class Quote < ApplicationRecord
	validates :text, presence: true, length: { minimum: 5, maximum: 1000 }
	validates :author, presence: true, length: { minimum: 1, maximum: 20}  
end
