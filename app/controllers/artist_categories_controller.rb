class ArtistCategoriesController < ApplicationController
    before_action :set_category, only: [:edit, :update, :destroy]
    before_action :require_admin

  
    def index
      @categories = ArtistCategory.all
    end
  
    def new
      @category = ArtistCategory.new
    end
  
    def create
      @category = ArtistCategory.new(category_params)
  
      if @category.save
        redirect_to artist_categories_path, notice: "Category was successfully created."
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @category.update(category_params)
        redirect_to artist_categories_path, notice: "Category was successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      @category.destroy
      redirect_to artist_categories_path, notice: "Category was successfully deleted."
    end
  
    private
  
    def set_category
      @category = ArtistCategory.find(params[:id])
    end
  
    def category_params
      params.require(:artist_category).permit(:name)
    end
  end
  