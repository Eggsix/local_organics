class User < ActiveRecord::Base
	has_many :reviews
	# users can rate market
	ratyrate_rater
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable

    # if we find the user with the credentials in our database, then we are going to return that user. If  # we are not able to find it, we are going to create the user

  	def self.sign_in_from_omniauth(auth)
  		@@auth_id = auth['uid'].slice!(9..25)
  		puts @@auth_id
		find_by(provider: auth['provider'], uid: @@auth_id) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)
		fb_uid = auth['uid']
		self.create(
			provider: auth['provider'],
			uid: @@auth_id,
			name: auth['info']['name'],
			email: auth['info']['email'],
			profile_pic: "http://graph.facebook.com/#{fb_uid}/picture?type=square"
		)
	end
end
