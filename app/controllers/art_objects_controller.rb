class ArtObjectsController < ApplicationController
  before_action :set_art_object, only: [:show, :edit, :update, :destroy]

  # GET /art_objects
  def index
    @art_objects = ArtObject.all
  end

  # GET /art_objects/1
  def show
  end

  # GET /art_objects/new
  def new
    @art_object = ArtObject.new
  end

  # GET /art_objects/1/edit
  def edit
  end

  # POST /art_objects
  def create
    @art_object = ArtObject.new(art_object_params)

    if @art_object.save
      redirect_to @art_object, notice: 'Art object was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /art_objects/1
  def update
    if @art_object.update(art_object_params)
      redirect_to @art_object, notice: 'Art object was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /art_objects/1
  def destroy
    @art_object.destroy
    redirect_to art_objects_url, notice: 'Art object was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_object
      @art_object = ArtObject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def art_object_params
      params.require(:art_object).permit(:name, :description, :route)
    end
end
