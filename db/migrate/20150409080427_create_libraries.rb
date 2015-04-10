class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.integer :view_times

      t.timestamps null: false
    end
    add_foreign_key :libraries, :users
    add_foreign_key :libraries, :books
  end
end
