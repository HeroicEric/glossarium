class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :name
      t.text :definition
      t.integer :glossary_id

      t.timestamps
    end
  end
end
