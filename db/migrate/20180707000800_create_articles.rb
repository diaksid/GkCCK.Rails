class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.boolean :published, :navigated, default: false, index: true
      t.date :published_at, index: true

      t.string :header, null: false, index: true
      t.text :annotation
      t.text :content, null: false
      t.boolean :partial, default: false

      t.string :title
      t.string :keywords
      t.string :description
      t.string :canonical
      t.string :robots

      t.string :source

      t.timestamps
    end
  end
end
