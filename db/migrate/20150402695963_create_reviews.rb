class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.text :text
      t.integer :rating_out_of_ten

      t.timestamps
    end
    add_foreign_key :reviews, :books
    add_foreign_key :reviews, :users
  end
end