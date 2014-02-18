class SessionsController < ApplicationController
	include SessionsHelper
	def new
		user = Admins.new
	end

	def create
		user = Admins.find_by(email: params[:session][:email].downcase,password: params[:session][:password])
		if user
			sign_in user
			flash[:message] = 'Login success'
			redirect_to '/movies/home'
		else
			flash[:error] = 'Invalid email/password'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to '/sessions/new'
	end
end
