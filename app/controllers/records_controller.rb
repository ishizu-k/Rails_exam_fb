class RecordsController < ApplicationController
  def index
  end

  def new
    @record = Record.new
  end

end
