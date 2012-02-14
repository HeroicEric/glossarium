class CreateGlossaries < ActiveRecord::Migration
  def up
    create_table :glossaries do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :glossaries
  end
end
