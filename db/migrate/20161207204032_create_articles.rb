class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :author_id, null: false
      t.string :status, null: false
      t.string :title, null: false

      t.timestamps(null: false)
    end
  end
end
