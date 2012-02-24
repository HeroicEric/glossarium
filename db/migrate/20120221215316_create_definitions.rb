class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.text :text

      t.timestamps
    end

    add_column :terms, :definition_id, :integer
  end
end
