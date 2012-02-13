class GlossaryManager
  attr_accessor :glossaries
  attr_writer :glossary_maker

  def initialize
    @glossaries = []
  end

  def add_glossary(glossary)
    @glossaries << glossary
  end

  def new_glossary(*args)
    glossary_maker.call(*args).tap do |g|
      g.glossary_manager = self
    end
  end

  private

  def glossary_maker
    @glossary_maker ||= Glossary.public_method(:new)
  end

end