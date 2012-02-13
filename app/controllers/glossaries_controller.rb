class GlossariesController < ApplicationController
  def index
  end

  def new
    @glossary = @gm.new_glossary
  end

  def create
    @glossary = @gm.new_glossary(params[:glossary])
    @glossary.add_to_glossaries
    redirect_to root_path, notice: "Glossary added!"
  end
end