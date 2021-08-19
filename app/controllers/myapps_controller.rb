class MyappsController < ApplicationController
  before_action :set_myapp, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /myapps or /myapps.json
  def index
    @myapps = Myapp.all
  end

  # GET /myapps/1 or /myapps/1.json
  def show
  end

  # GET /myapps/new
  def new
    #@myapp = Myapp.new
    @myapp = current_user.myapps.build
  end

  # GET /myapps/1/edit
  def edit
  end

  # POST /myapps or /myapps.json
  def create
    #@myapp = Myapp.new(myapp_params)
    @myapp = current_user.myapps.build(myapp_params)
    respond_to do |format|
      if @myapp.save
        format.html { redirect_to @myapp, notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @myapp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @myapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /myapps/1 or /myapps/1.json
  def update
    respond_to do |format|
      if @myapp.update(myapp_params)
        format.html { redirect_to @myapp, notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @myapp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @myapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myapps/1 or /myapps/1.json
  def destroy
    @myapp.destroy
    respond_to do |format|
      format.html { redirect_to myapps_url, notice: "Myapp was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def correct_user
    @myapp = current_user.myapps.find_by(id: params[:id])
    redirect_to myapps_path, notice: "Not Authorized To Edit This Friend" if @myapp.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_myapp
      @myapp = Myapp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def myapp_params
      params.require(:myapp).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
