class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  
  def index
    #show all listings
    @listings = Listing.all
  end

  def show 
    #view a single listing
  end 

  def create
    # create new listing
    @listing = Listing.create(params[listing_params])
    byebug
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet )
  end

  def update
    #updates the current listing
  end

  def edit
    #shows the edit forms
  end

  def destroy
    #deletes current listing
  end

  def new
    #shows forms for creating a new listing
    @listing = Listing.new
    @breeds = Breed.all
    @sexes = Listing.sexes.keys
  end


  private

  def set_listing
    id = params[:id]
    @listing = Listing.find(id)
  end

 
end