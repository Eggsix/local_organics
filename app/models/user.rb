class User < ActiveRecord::Base
  # if we find the user with the credentials in our database, then we are going to return that user. If  # we are not able to find it, we are going to create the user
  	def self.sign_in_from_omniauth(auth)
		find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)
		fb_uid = auth['uid']
		self.create(
			provider: auth['provider'],
			uid: auth['uid'],
			name: auth['info']['name'],
			email: auth['info']['email'],
			profile_pic: "http://graph.facebook.com/#{fb_uid}/picture?type=square"
		)
	end

	# def self.from_omniauth(auth)
	#     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	#       user.provider         = auth.provider
	#       user.uid              = auth.uid
	#       user.oauth_token      = auth.credentials.token
	#       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	#       user.name             =  auth.info.name
	#       user.save
	#   end
	# end
end
