class TermsController < ApplicationController
  def show
    @term = Term.find(params[:id])
  end

  def new
    @glossary = Glossary.find(params[:glossary_id])
    @term = @glossary.new_term
  end

  def create
    @glossary = Glossary.find(params[:glossary_id])
    @term = @glossary.new_term(params[:term])

    if @term.save
      redirect_to glossary_path(@glossary),
        notice: "Term was successfully added to glossary!"
    else
      render :new
    end
  end
end