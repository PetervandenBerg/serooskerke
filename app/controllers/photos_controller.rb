class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :get_surrounding
  # GET /photos
  # GET /photos.json
  def index
    @photos = @surrounding.photos
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = @surrounding.photos.find(params[:id])
  end

  # GET /photos/new
  def new
    @surrounding = Surrounding.find(params[:surrounding_id])
    @photo = @surrounding.photos.build
  end

  # GET /photos/1/edit
  def edit
    @surrounding = Surrounding.find(params[:surrounding_id])
    @photo = @surrounding.photos.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = @surrounding.photos.build(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to '/surroundings/1/', notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    @photo = @surrounding.photos.find(params[:id])

    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to surrounding_photos_url(@surrounding), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = @surrounding.photos.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to (surrounding_photos_path(@surrounding)) }
      format.json { head :no_content }
    end
  end

  private

    def get_surrounding
      @surrounding = Surrounding.find(params[:surrounding_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :surrounding_id, :image)
    end
end
