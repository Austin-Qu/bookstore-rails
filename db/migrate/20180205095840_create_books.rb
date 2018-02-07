class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :author_name
      t.string :publisher_name
      t.date :published_date
      t.decimal :unit_price

      t.timestamps
    end
  end
end
