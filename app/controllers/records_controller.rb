class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :update, :destroy]

  def index
    @records = Record.all.order(created_at: :desc)
  end

  def new
    if params[:back]
      @record = Record.new(record_params)
    else
      @record = Record.new
    end
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      flash[:notice] = '投稿しました'
      redirect_to records_path
    else
      render 'new'
    end
  end

  def edit
    if params[:back]
      @record.content = record_params[:content]
      @record.image_cache = record_params[:image_cache]
    end
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

  def confirm
    if params[:id].nil?
      @record = current_user.records.build(record_params)
      render :new if @record.invalid?
    else
      set_record
      @record.content = record_params[:content]
      @record.image = record_params[:image]
      @record.image_cache = record_params[:image_cache]
      render :edit if @record.invalid?
    end
  end

  private

  def record_params
    params.require(:record).permit(:content, :image, :image_cache)
  end

  def set_record
    @record = Record.find(params[:id])
  end

end
