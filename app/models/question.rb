class Question < ApplicationRecord
	
	validates :text, presence: true, length: { minimum: 5, maximum: 1000 }
	validates :author, presence: true, length: { minimum: 1, maximum: 20}
	
	VALID_EMAIL_REGEX = /([a-zA-Z0-9]+)@([a-zA-Z0-9]+).([a-zA-z]{2,5})/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

end
