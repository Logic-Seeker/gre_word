class CreateWordLists < ActiveRecord::Migration
  def change
    create_table :word_lists do |t|
      t.string :word
      t.string :meaning
      t.text :sentence

      t.timestamps
    end
  end
end
