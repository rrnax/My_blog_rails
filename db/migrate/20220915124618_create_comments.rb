class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.datetime :comment_date
      t.text :content
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
