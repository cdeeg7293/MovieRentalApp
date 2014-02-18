module SessionsHelper
	def sign_in(user)
		session[:useremail] = user.email
	end

	def signed_in?
		!session[:useremail].nil?
	end

	def current_user
		session[:useremail]
	end
	
	def sign_out
		session[:useremail] = nil
	end
end
