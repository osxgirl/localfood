class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]


  def index
    @drinks = Drink.all
  end


  def show
  end


  def new
    @drink = Drink.new
  end


  def edit
  end

 
  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to @drink, notice: 'Drink Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @drink }
      else
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to @drink, notice: 'Drink Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        format.html { render :edit }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
     Drink.find(params[:id]).destroy
     redirect_to drinks_url
   end

  private
    def set_drink
      @drink = Drink.find(params[:id])
    end

  
    def drink_params
      params.require(:drink).permit(:business, :website)
    end
end
