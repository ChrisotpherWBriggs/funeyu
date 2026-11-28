class User < ApplicationRecord

	has_many :articles

	normalizes :email, with: ->(email) { email.strip.downcase }

	validates :password,
          presence: true,
          length: { minimum: 8 },
          format: {
            with: /[A-Z]/,
            message: "must contain at least one uppercase letter"
          },
          allow_nil: true

	validates :password,
          format: {
            with: /[a-z]/,
            message: "must contain at least one lowercase letter"
          },
          allow_nil: true

	validates :password,
          format: {
            with: /[0-9]/,
            message: "must contain at least one number"
          },
          allow_nil: true

	validates :password,
          format: {
            with: /[[:punct:]]/,
            message: "must contain at least one special character"
          },
          allow_nil: true


	validates :username, presence: true, 
						uniqueness: { case_sensitive: false }, 
						length: { minimum: 3, maximum: 25 }
	
	validates :email, presence: true, 
						uniqueness: { case_sensitive: false }, 
						length: { maximum: 105 },
						format: { with: URI::MailTo::EMAIL_REGEXP }



	has_secure_password
end