class CarouselItemsController < ApplicationController
  # GET /carousel_items
  # GET /carousel_items.json
  def index
    @carousel_items = CarouselItem.all
    @items = CarouselItem.where(:active => true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carousel_items }
    end
  end

  # GET /carousel_items/1
  # GET /carousel_items/1.json
  def show
    @carousel_item = CarouselItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @carousel_item }
    end
  end

  # GET /carousel_items/new
  # GET /carousel_items/new.json
  def new
    @carousel_item = CarouselItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @carousel_item }
    end
  end

  # GET /carousel_items/1/edit
  def edit
    @carousel_item = CarouselItem.find(params[:id])
  end

  # POST /carousel_items
  # POST /carousel_items.json
  def create
    @carousel_item = CarouselItem.new(params[:carousel_item])

    respond_to do |format|
      if @carousel_item.save
        format.html { redirect_to carousel_items_path, notice: 'Carousel item was successfully created.' }
        format.json { render json: @carousel_item, status: :created, location: @carousel_item }
      else
        format.html { render action: "new" }
        format.json { render json: @carousel_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carousel_items/1
  # PUT /carousel_items/1.json
  def update
    @carousel_item = CarouselItem.find(params[:id])

    respond_to do |format|
      if @carousel_item.update_attributes(params[:carousel_item])
        format.html { redirect_to carousel_items_path, notice: 'Carousel item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @carousel_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carousel_items/1
  # DELETE /carousel_items/1.json
  def destroy
    @carousel_item = CarouselItem.find(params[:id])
    @carousel_item.destroy

    respond_to do |format|
      format.html { redirect_to carousel_items_url }
      format.json { head :ok }
    end
  end

  def switch
    @carousel_item = CarouselItem.find(params[:id])

    if @carousel_item.active 
      @carousel_item.active = false
    else
      @carousel_item.active = true
    end
    @carousel_item.save
    
    respond_to do |format|
      format.html { redirect_to carousel_items_url }
      format.json { head :ok }
    end
  end

end
