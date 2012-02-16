class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_glossaries

  private

  def get_glossaries
    @glossaries = Glossary.all
  end
end
