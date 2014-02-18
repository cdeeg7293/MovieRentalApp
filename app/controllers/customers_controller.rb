class CustomersController < ApplicationController
	def new
		@customers = Customers.new
	end

	def revoke
		@movie = Rentals.new
	end
	
	def create
		@customers = Customers.find_by_mobile(params[:customers][:mobile])
		@movies = Movies.find_by_name(params[:customers][:movie_name])
		if @customers.movie_count < 5
			if @movies && @movies.status
				if @customers
					Rentals.create(:mobile => params[:customers][:mobile], :movie_name => params[:customers][:movie_name])
					@movies.update_attribute(:status,false)
					@customers.increment!(:movie_count)
					redirect_to '/movies/home'
				else
					Rentals.create(:mobile => params[:customers][:mobile], :movie_name => params[:customers][:movie_name])
					temp = Customers.new(customer_params)
					temp.movie_count = 1
					temp.save
					@movies.update_attributes(:status => false)
					redirect_to '/movies/home'
				end
			else
				flash.now[:notice] = "Movie not available/found"
				render 'new'
			end
		else
			flash[:notice] = "Movie limit exceeded"
			render 'new'
		end
	end

	def update
	end

	def destroy
		@movie = Rentals.find_by_movie_name_and_mobile(params[:customers][:movie_name],params[:customers][:mobile])
		@customers = Customers.find_by_mobile(params[:customers][:mobile])
		@movieset = Movies.find_by_name(params[:customers][:movie_name])
		if @movie
			@movie.destroy
			@customers.decrement!(:movie_count)
			@movieset.update_attributes(:status => true)
			redirect_to '/movies/home'
		else
			flash.now[:notice] = 'Movie not rented'
			render '/customers/revoke'
		end
	end

	private

	def customer_params
		params.require(:customers).permit(:name,:email,:mobile,:address,:movie_name)
	end
end
