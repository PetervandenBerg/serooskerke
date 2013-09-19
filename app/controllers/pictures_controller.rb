class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :get_impression
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = @impression.pictures
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = @impression.pictures.find(params[:id])
  end

  # GET /pictures/new
  def new
    @impression = Impression.find(params[:impression_id])
    @picture = @impression.pictures.build
  end

  # GET /pictures/1/edit
  def edit
    @impression = Impression.find(params[:impression_id])
    @picture = @impression.pictures.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = @impression.pictures.build(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to '/impressions/1/', notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @picture }
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    @picture = @impression.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to impression_pictures_url(@impression), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = @impression.pictures.find(params[:id])
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to (impression_pictures_path(@impression)) }
      format.json { head :no_content }
    end
  end

  private

    def get_impression
      @impression = Impression.find(params[:impression_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:title, :impression_id, :image)
    end
end
