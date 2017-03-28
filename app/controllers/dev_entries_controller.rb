class DevEntriesController < ApplicationController
  before_action :set_dev_entry, only: [:show, :edit, :update, :destroy]

  # GET /dev_entries
  # GET /dev_entries.json
  def index
    @dev_entries = DevEntry.all
  end

  # GET /dev_entries/1
  # GET /dev_entries/1.json
  def show
  end

  # GET /dev_entries/new
  def new
    # @dev_entry = current_user.dev_entries.build
  end

  # GET /dev_entries/1/edit
  def edit
  end

  # POST /dev_entries
  # POST /dev_entries.json
  def create
    @dev_entry = current_user.dev_entries.build(dev_entry_params)


    respond_to do |format|
      if @dev_entry.save
        format.html { redirect_to @dev_entry, notice: 'Dev entry was successfully created.' }
        format.json { render :show, status: :created, location: @dev_entry }
      else
        format.html { render :new }
        format.json { render json: @dev_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dev_entries/1
  # PATCH/PUT /dev_entries/1.json
  def update
    respond_to do |format|
      if @dev_entry.update(dev_entry_params)
        format.html { redirect_to @dev_entry, notice: 'Dev entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @dev_entry }
      else
        format.html { render :edit }
        format.json { render json: @dev_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dev_entries/1
  # DELETE /dev_entries/1.json
  def destroy
    @dev_entry.destroy
    respond_to do |format|
      format.html { redirect_to dev_entries_url, notice: 'Dev entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dev_entry
      @dev_entry = DevEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_entry_params
      params.require(:dev_entry).permit(:devDate, :devDuration, :note, :project_id, :user_id)
    end
end
