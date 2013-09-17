class SurroundingsController < ApplicationController
  before_action :set_surrounding, only: [:show, :edit, :update, :destroy]

  # GET /surroundings
  # GET /surroundings.json
  def index
    @surroundings = Surrounding.all
  end

  # GET /surroundings/1
  # GET /surroundings/1.json
  def show
    @surroundings = Surrounding.all
    @surrounding = Surrounding.find(params[:id])
    @photos = @surrounding.photos
  end

  # GET /surroundings/new
  def new
    @surrounding = Surrounding.new
  end

  # GET /surroundings/1/edit
  def edit
  end

  # POST /surroundings
  # POST /surroundings.json
  def create
    @surrounding = Surrounding.new(surrounding_params)

    respond_to do |format|
      if @surrounding.save
        format.html { redirect_to @surrounding, notice: 'Surrounding was successfully created.' }
        format.json { render action: 'show', status: :created, location: @surrounding }
      else
        format.html { render action: 'new' }
        format.json { render json: @surrounding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surroundings/1
  # PATCH/PUT /surroundings/1.json
  def update
    respond_to do |format|
      if @surrounding.update(surrounding_params)
        format.html { redirect_to @surrounding, notice: 'Surrounding was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @surrounding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surroundings/1
  # DELETE /surroundings/1.json
  def destroy
    @surrounding.destroy
    respond_to do |format|
      format.html { redirect_to surroundings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surrounding
      @surrounding = Surrounding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surrounding_params
      params.require(:surrounding).permit(:title, :description)
    end
end
