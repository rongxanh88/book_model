class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.references :publisher
      t.references :author
      t.references :book_formats

      t.timestamps
    end
  end
end
