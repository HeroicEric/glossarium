class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :init_glossary_manager

  private

  def init_glossary_manager
    @gm = THE_GLOSSARY_MANAGER
  end
end
