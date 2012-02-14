class GlossariesController < ApplicationController
  def index
  end

  def new
    @glossary = @gm.new_glossary
  end

  def create
    @glossary = @gm.new_glossary(params[:glossary])

    if @glossary.save
      redirect_to root_path, notice: "Glossary added!"
    else
      render :new
    end
  end
end