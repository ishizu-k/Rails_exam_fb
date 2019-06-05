class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :update, :destroy]

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      flash[:notice] = '投稿しました'
      redirect_to records_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      flash[:notice] = '編集しました'
      redirect_to records_path
    else
      render 'edit'
    end
  end

  def destroy
    @record.destroy
    flash[:notice] = '削除しました'
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:content)
  end

  def set_record
    @record = Record.find(params[:id])
  end

end
