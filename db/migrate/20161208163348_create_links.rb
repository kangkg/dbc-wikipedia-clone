class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :word, null: false
      t.integer :article_id, null:false
      t.timestamps
    end
  end
end
