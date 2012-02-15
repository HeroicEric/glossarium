class GlossariesController < ApplicationController
  def index
    @glossaries = Glossary.all
  end

  def new
    @glossary = Glossary.new
  end

  def create
    @glossary = Glossary.new(params[:glossary])

    if @glossary.save
      redirect_to root_path, notice: "Glossary added!"
    else
      render :new
    end
  end

  def show
    @glossary = Glossary.find(params[:id])
  end
end