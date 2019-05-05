class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show]
  before_action :set_listing, only: [:show,:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :set_breeds_and_sexes, only: [:new, :edit]
  def index
    #show all listings
    @listings = Listing.all
  end

  def show 
    #view a single listing
  end 

  def create
    # create new listing
    @listing = current_user.listings.create(listing_params)
    # byebug
    if @listing.errors.any?
      set_breeds_and_sexes
      render "new"
    else
      redirect_to listings_path
    end
    
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
  end


  private

  def set_breeds_and_sexes
    @breeds = Breed.all
    @sexes = Listing.sexes.keys
  end

  def set_listing
    id = params[:id]
    @listing = Listing.find(id)
  end

 def set_user_listing
  #method 1
  # @listing = Listing.where(user_id: current_user.id, id: params[:id]).first
  # if !@listing
  #   redirect_to listings_path 
  # end

 end

  #method 2
 def authorize_user
  if @listing.user_id != current_user.id
    redirect_to listings_path
  end
 end

  def listing_params
    params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet, :picture )
  end
end