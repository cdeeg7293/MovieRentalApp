class MoviesController < ApplicationController

	def home
		@movie = Movies.find(:all)
	end
	
	def get_borrower(mov_name)
		return mov_name
	end
	
	def new
		@movie = Movies.new
	end
	
	def remove
	end
	
	def create
		@movie = Movies.new(movie_params)
		if @movie.save
			flash.now[:notice] = "Movie added succesfully"
			redirect_to '/movies/home'
		else
			flash.now[:notice] = "Can't save movie"
			render 'new'
		end
	end

	def update
		@movie = Movies.find(params[:id])
		if @movie.update_attributes(movie_params)
			flash.now[:message] = "Updated succesfully"
		end
	end
	
	def destory
		@movie = Movies.find_by_movie_name(params[:movies][:name])
		if @movie
			@movie.destory
			redirect_to '/movies/home'
		else
			flash.now[:notice] = 'Request for deletion denied'
			render 'new'
		end
	end

	private

	def movie_params
		params.require(:movies).permit(:name,:language,:year_of_release,:genre,:status)
	end
end
