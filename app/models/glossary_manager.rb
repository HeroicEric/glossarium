class GlossaryManager
  attr_writer :glossary_maker

  def glossaries
    Glossary.all
  end

  def add_glossary(glossary)
    glossary.save
  end

  def new_glossary(*args)
    Glossary.new(*args)
  end

end