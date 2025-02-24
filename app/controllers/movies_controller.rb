class MoviesController < ApplicationController
    def index
      render json: Movie.all
    end
  
    def create
      movie = Movie.new(movie_params)
      if movie.save
        render json: movie, status: :created
      else
        render json: movie.errors, status: :unprocessable_entity
      end
    end
  
    def delete
      movie = Movie.find(params[:id])
      if movie.destroy
        render json: { message: 'Filmen är borttagen' }, status: :ok
      else
        render json: { error: 'Kunde inte ta bort filmen' }, status: :unprocessable_entity
      end
    end
  
    def update
      movie = Movie.find(params[:id])
  
      if movie.update(category: params[:category])
        render json: movie, status: :ok
      else
        render json: movie.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def movie_params
      params.permit(:title, :category)
    end
  end
  