class FnafsController < ApplicationController
  before_action :set_fnaf, only: [:show, :edit, :update, :destroy]
  before_action :only_allow_signed_in_users, except: [:index, :show]

  # GET /fnafs
  # GET /fnafs.json
  def index
    @fnafs = Fnaf.all.paginate(page: params[:page], per_page: 5)
    # if params[:search]
      # @fnafs = Fnaf.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    # else
      # @fnafs = Fnaf.find(:all)
    # end
  end

  # GET /fnafs/1
  # GET /fnafs/1.json
  def show
    # @fnaf = Fnaf.find(params[:id])
  end

  # GET /fnafs/new
  def new
    @fnaf = Fnaf.new
  end

  # GET /fnafs/1/edit
  def edit
  end

  # POST /fnafs
  # POST /fnafs.json
  def create
    @fnaf = Fnaf.new(fnaf_params)

    respond_to do |format|
      if @fnaf.save
        format.html { redirect_to @fnaf, notice: 'Fnaf was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fnaf }
      else
        format.html { render action: 'new' }
        format.json { render json: @fnaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fnafs/1
  # PATCH/PUT /fnafs/1.json
  def update
    respond_to do |format|
      if @fnaf.update(fnaf_params)
        format.html { redirect_to @fnaf, notice: 'Fnaf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fnaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fnafs/1
  # DELETE /fnafs/1.json
  def destroy
    @fnaf.destroy
    respond_to do |format|
      format.html { redirect_to fnafs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fnaf
      @fnaf = Fnaf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fnaf_params
      params.require(:fnaf).permit(:name, :picture, :species, :gender, :first_game, :second_game, :third_game, :search)
    end
end
