class ImpressionsController < ApplicationController
  before_action :set_impression, only: [:edit, :update]

  def index
    @impressions = Impression.all
  end

  def show
    @impressions = Impression.all
    @impression = Impression.find(params[:id])
    @pictures = @impression.pictures

  end

  # GET /impressions/new
  def new
    @impression = Impression.new
  end

  # GET /impressions/1/edit
  def edit
  end

  # POST /impressions
  # POST /impressions.json
  def create
    @impression = Impression.new(impression_params)

    respond_to do |format|
      if @impression.save
        format.html { redirect_to @impression, notice: 'Impression was successfully created.' }
        format.json { render action: 'show', status: :created, location: @impression }
      else
        format.html { render action: 'new' }
        format.json { render json: @impression.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @impression.update(impression_params)
        format.html { redirect_to @impression, notice: 'Impression was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @impression.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impression
      @impression = Impression.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impression_params
      params[:impression].permit(:title, :description)
    end
end
