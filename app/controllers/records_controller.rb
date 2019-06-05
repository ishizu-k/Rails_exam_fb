class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to records_path, notice: "投稿しました"
    else
      render 'new'
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to records_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def record_params
    params.require(:record).permit(:content)
  end

end
