class DevEntriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json
  def index
    respond_with DevEntry.all
  end

  def show
    respond_with DevEntry.find(params[:id])
  end

  def create
    respond_with DevEntry.create!(params[:dev_entry])
  end

  def update
    respond_with DevEntry.update(params[:id], params[:dev_entry])
  end

  def destroy
    respond_with DevEntry.destroy(params[:id])
  end

  private
    def dev_entry_params
      params[:dev_entry].permit(:devDate, :devDuration, :note, :project_id, :user_id, :project => [:id, :name, :dueDate, :budget, :user_id], :user => [:id])
    end
end
