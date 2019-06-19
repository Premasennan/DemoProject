class User < ApplicationRecord
	before_create :set_token
	has_secure_password

	def set_token
		self.token = SecureRandom.uuid
	end 

	def self.valid_login?(user_params)
    user = find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      user
    end
  end
end
