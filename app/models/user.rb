class User < ApplicationRecord
	has_many :reviews
	has_secure_token :oauth_token
	has_many :likes
	has_many :reports
	# TODO: validations

	def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.email = auth.info.email
			user.picture = auth.info.image
			user.regenerate_oauth_token unless user.banned
			user.save!
		end
	end


end
