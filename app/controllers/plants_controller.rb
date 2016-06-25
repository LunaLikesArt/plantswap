class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /plants
  # GET /plants.json
  def index
    @plants = Plant.all
  end

  # GET /plants/1
  # GET /plants/1.json
  def show
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
    @plant = Plant.find(params[:id])
    if @plant.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
  end

  # POST /plants
  # POST /plants.json
  def create
    @plant = current_user.plants.create(plant_params)
    if plant.valid?
      redirect_to plants_path
    else
      render :new, status: :unprocessable_entity
    end

    # respond_to do |format|
    #   if @plant.save
    #     format.html { redirect_to @plant, notice: 'Plant was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @plant }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @plant.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /plants/1
  # PATCH/PUT /plants/1.json
  def update
    # respond_to do |format|
    #   if @plant.update(plant_params)
    #     format.html { redirect_to @plant, notice: 'Plant was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @plant.errors, status: :unprocessable_entity }
    #   end
    # end
    @plant = Plant.find(params[:id])
    if @plant.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @plant.update_attributes(plant_params)
    if plant.valid?
      redirect_to plants_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /plants/1
  # DELETE /plants/1.json
  def destroy
    @plant = Plant.find(params[:id])
    if @plant.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @plant.destroy
    redirect_to plants_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_plant
    @plant = Plant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def plant_params
    params.require(:plant).permit(:name, :description, :city, :state)
  end
end
