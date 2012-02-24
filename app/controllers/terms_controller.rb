class TermsController < ApplicationController
  def show
    @glossary = Glossary.find(params[:glossary_id])
    @term = Term.find(params[:id])
  end

  def new
    @glossary = Glossary.find(params[:glossary_id])
    @term = @glossary.new_term
    @definition = @term.build_definition
  end

  def create
    @glossary = Glossary.find(params[:glossary_id])
    @term = @glossary.terms.build(params[:term])

    if params[:termOptions] == "synonym"
      original_term = @glossary.terms.where(name: params[:original_term]).first
      @term.definition = original_term.definition
    end

    if @term.save
      redirect_to glossary_path(@glossary),
        notice: "Term was successfully added to glossary!"
    else
      render :new
    end
  end

  def edit
    @glossary = Glossary.find(params[:glossary_id])
    @term = Term.find(params[:id])
  end

  def update
    @term = Term.find(params[:id])

    if @term.update_attributes(params[:term])
      redirect_to glossary_term_path(@term), notice: "Changes were saved!"
    else
      render :edit
    end
  end

  def destroy
    @term = Term.find(params[:id])
    @term.destroy
    redirect_to glossary_path(@term.glossary), notice: "Term was successfully deleted!"
  end

end