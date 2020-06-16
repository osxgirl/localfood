class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
    @food.items.build
  end

  def edit
  end
  
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     Food.find(params[:id]).destroy
     redirect_to foods_url
  end
  

  private

    def set_food
      @food = Food.find(params[:id])
    end
    
    def food_params
          params.require(:food).permit( :business,
          :website,
          items_attributes: [
            :item_1,
            :items_type
          ]
        )
    end
end
