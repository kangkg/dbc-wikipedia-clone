class CreateRevisions < ActiveRecord::Migration[5.0]
  def change
    create_table :revisions do |t|
      t.integer :editor_id, null: false
      t.integer :article_id, null: false
      t.text :body, null: false
      t.integer :previous_revision_id
      t.timestamps
    end
  end
end
