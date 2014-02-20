class RentalsController < ApplicationController
	def destroy
		Rentals.find_by_movie_name(params[:name]).delete
		Movies.find_by_name(params[:name]).update_attributes(:status => true)
		redirect_to '/movies/home'
	end
end
