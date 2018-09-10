class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.boolean :published, :navigated, default: false, index: true
      t.date :published_at, index: true

      t.string :header, null: false, index: true
      t.text :content

      t.string :title
      t.string :keywords
      t.string :description
      t.string :canonical
      t.string :robots

      t.references :partner, foreign_key: {on_delete: :nullify}
      t.string     :partner_as
      t.string     :source

      t.integer :index, default: 0, index: true

      t.timestamps
    end
  end
end
