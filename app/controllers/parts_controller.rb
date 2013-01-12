class PartsController < ApplicationController
  
  def new
    @part = Part.new
  end
  
  def create
    @part = Part.new(params[:part])
    
    if @part.save
      redirect_to parts_path, notice: "You successfully added the new part: #{@part.name}"
    else
      render :new
    end
  end
  
  def show
    @part = Part.find(params[:id])
  end
  
  def edit
    @part = Part.find(params[:id])
  end
  
  def update
    @part = Part.find(params[:id])
    
    if @part.update_attributes(params[:part])
      redirect_to part_path(@part), notice: "You successfully updated the part: #{@part.name}"
    else
      render :edit
    end
  end
  
  def index
    @parts = Part.all
  end
  
  def destroy
    @part = Part.find(params[:id]).destroy
    redirect_to parts_path
  end
  
end