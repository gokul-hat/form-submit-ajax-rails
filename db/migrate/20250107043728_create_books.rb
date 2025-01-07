class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :titile
      t.float :price
      t.string :author
      t.string :genre

      t.timestamps
    end
  end
end
