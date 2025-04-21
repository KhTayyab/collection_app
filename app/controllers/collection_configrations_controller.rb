class CollectionConfigrationsController < ApplicationController

	before_action :set_collection_configration, only: [:show, :edit, :update, :destroy]

  def index
    # if params[:shop].present?
    #   @collection_configrations = CollectionConfigration.where(:shop_name => params[:shop]).order('id ASC')
    # else
    #   redirect_to "https://www.google.com"
    # end
    @collection_configrations = CollectionConfigration.where(:shop_name => params[:shop]).order('id ASC')
  end

  def show
  end

  def new
    @collection_configration = CollectionConfigration.new
  end

  def edit
  end

  def create
    @collection_configration = CollectionConfigration.new(collection_configration_params)
    if @collection_configration.save
      redirect_to collection_configrations_path(:shop => @collection_configration.shop_name)
    else
      render :new
    end
  end

  def update
    if @collection_configration.update(collection_configration_params)
      redirect_to collection_configrations_path(:shop => @collection_configration.shop_name)
    else
      render :edit
    end
  end

  def destroy
    shop_name = @collection_configration.shop_name
    @collection_configration.destroy
    redirect_to collection_configrations_path(:shop => shop_name)
  end


  def get_collection_images
    collection_configrations = CollectionConfigration.where(:shop_name => params[:shop], :collection_name => params[:collection_name])
    if collection_configrations.count == 1
      collection_configration = collection_configrations.first
      if not collection_configration.avatar.nil?
        render status:200, json: {image_link: collection_configration.avatar.url, :image_present => true}  
      else
        render status:200, json: {image_link: "", :image_present => false}
      end
    else
      render status:200, json: {image_link: "", :image_present => false}
    end
  end

  private
    
  def set_collection_configration
    @collection_configration = CollectionConfigration.find(params[:id])
  end

  def collection_configration_params
    params.require(:collection_configration).permit(:collection_name, :avatar, :shop_name)
  end

end
