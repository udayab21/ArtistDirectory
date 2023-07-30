class ReviewsController < ApplicationController
  before_action :set_current_user
    before_action :find_artist
    before_action :find_review, only: [:edit, :update]
  
    def new
      @review = @artist.reviews.build
    end
  
    def create
      @review = @artist.reviews.new(review_params)
      @review.user = @current_user
      if @review.save
        redirect_to artist_path(@artist), notice: "Review created successfully."
      else 
        redirect_to artist_path(@artist), notice: "Review not created ."
     
      end
    end
  
    def edit
    end
  
    def update
      if @review.update(review_params)
        redirect_to @artist, notice: "Review updated successfully."
      else
        render :edit
      end
    end
  
    private
  
    def find_artist
      @artist = Artist.find(params[:artist_id])
    end
  
    def find_review
      @review = @artist.reviews.find(params[:id])
    end
  
    def review_params
      params.require(:review).permit(:rating, :comment).merge(user_id: @current_user.id)
    end
  end
  
      
