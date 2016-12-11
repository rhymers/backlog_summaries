class CreatedUsersController < ApplicationController
  before_action :set_created_user, only: [:show, :edit, :update, :destroy]

  # GET /created_users
  # GET /created_users.json
  def index
    @created_users = CreatedUser.all
  end

  # GET /created_users/1
  # GET /created_users/1.json
  def show
  end

  # GET /created_users/new
  def new
    @created_user = CreatedUser.new
  end

  # GET /created_users/1/edit
  def edit
  end

  # POST /created_users
  # POST /created_users.json
  def create
    @created_user = CreatedUser.new(created_user_params)

    respond_to do |format|
      if @created_user.save
        format.html { redirect_to @created_user, notice: 'Created user was successfully created.' }
        format.json { render :show, status: :created, location: @created_user }
      else
        format.html { render :new }
        format.json { render json: @created_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /created_users/1
  # PATCH/PUT /created_users/1.json
  def update
    respond_to do |format|
      if @created_user.update(created_user_params)
        format.html { redirect_to @created_user, notice: 'Created user was successfully updated.' }
        format.json { render :show, status: :ok, location: @created_user }
      else
        format.html { render :edit }
        format.json { render json: @created_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /created_users/1
  # DELETE /created_users/1.json
  def destroy
    @created_user.destroy
    respond_to do |format|
      format.html { redirect_to created_users_url, notice: 'Created user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_created_user
      @created_user = CreatedUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def created_user_params
      params.require(:created_user).permit(:name)
    end
end
