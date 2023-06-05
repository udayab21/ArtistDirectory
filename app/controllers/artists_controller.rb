class ArtistsController < ApplicationController
  before_action :set_current_user
  before_action :require_user_logged_in!

  before_action :require_admin, only: %i[destroy toggle_is_approved]

    def index
      @artists = Artist.all
    end
  
    def new
      @artist = Artist.new
      @categories = ArtistCategory.all
    end
  
    def create
      @artist = Artist.new(artist_params)
      if @artist.save
        flash[:notice] = "Artist created successfully"
        redirect_to artists_path
      else
        @categories = ArtistCategory.all
        render :new
      end
    end
  
    def edit
      @artist = Artist.find(params[:id])
      @categories = ArtistCategory.all
    end
  
    def update
      @artist = Artist.find(params[:id])
      if @artist.update(artist_params)
        flash[:notice] = "Artist updated successfully"
        redirect_to artists_path
      else
        @categories = ArtistCategory.all
        render :edit
      end
    end
  
    def destroy
      @artist = Artist.find(params[:id])
      @artist.destroy
      flash[:notice] = "Artist deleted successfully"
      redirect_to artists_path 
    end

    def show
      @artist = Artist.find(params[:id])
      @categories = ArtistCategory.all
    end

    def artist_email
    @artist = Artist.find(params[:id])
    ArtistMailer.email_artist(@artist, "interested").deliver_now
    end

    def send_notification_email
      @artist = Artist.find(params[:id])
      InterestMailer.send_notification_email(@artist).deliver_now
      flash[:notice] = "Notification email sent!"
      redirect_to @artist
    end

    
  
    private
  
    def artist_params
      params.require(:artist).permit(:name, :date_of_birth, :location, :work, :email, :artist_category_id, :video_url)
    end

    

  end
  
  