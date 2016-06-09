class WelcomeController < ApplicationController

  def index
    @plants = Plant.all
  end

end
