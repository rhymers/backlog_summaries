class AssignersController < ApplicationController
  before_action :set_assigner, only: [:show, :edit, :update, :destroy]

  # GET /assigners
  # GET /assigners.json
  def index
    @assigners = Assigner.all
  end

  # GET /assigners/1
  # GET /assigners/1.json
  def show
  end

  # GET /assigners/new
  def new
    @assigner = Assigner.new
  end

  # GET /assigners/1/edit
  def edit
  end

  # POST /assigners
  # POST /assigners.json
  def create
    @assigner = Assigner.new(assigner_params)

    respond_to do |format|
      if @assigner.save
        format.html { redirect_to @assigner, notice: 'Assigner was successfully created.' }
        format.json { render :show, status: :created, location: @assigner }
      else
        format.html { render :new }
        format.json { render json: @assigner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assigners/1
  # PATCH/PUT /assigners/1.json
  def update
    respond_to do |format|
      if @assigner.update(assigner_params)
        format.html { redirect_to @assigner, notice: 'Assigner was successfully updated.' }
        format.json { render :show, status: :ok, location: @assigner }
      else
        format.html { render :edit }
        format.json { render json: @assigner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assigners/1
  # DELETE /assigners/1.json
  def destroy
    @assigner.destroy
    respond_to do |format|
      format.html { redirect_to assigners_url, notice: 'Assigner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assigner
      @assigner = Assigner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assigner_params
      params.require(:assigner).permit(:name)
    end
end
