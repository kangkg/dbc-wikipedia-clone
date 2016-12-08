class CreateSortedArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :sorted_articles do |t|
      t.integer :article_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
