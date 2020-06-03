class DessertsController < ApplicationController
  before_action :set_dessert, only: [:show, :edit, :update, :destroy]


  def index
    @desserts = Dessert.all
  end


  def show
  end


  def new
    @dessert = Dessert.new
  end


  def edit
  end

 
  def create
    @dessert = Dessert.new(dessert_params)

    respond_to do |format|
      if @dessert.save
        format.html { redirect_to @dessert, notice: 'Dessert Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @dessert }
      else
        format.html { render :new }
        format.json { render json: @dessert.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @dessert.update(dessert_params)
        format.html { redirect_to @dessert, notice: 'Dessert Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @dessert }
      else
        format.html { render :edit }
        format.json { render json: @dessert.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
     Dessert.find(params[:id]).destroy
     redirect_to desserts_url
   end

  private
    def set_dessert
      @dessert = Dessert.find(params[:id])
    end

  
    def dessert_params
      params.require(:dessert).permit(:business, :website)
    end
end
