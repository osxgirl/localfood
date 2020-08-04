class SecretsController < ApplicationController
  def show
      if current_user
          render :show
      else
          redirect_to '/login'
      end
  end
end
