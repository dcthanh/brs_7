class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true
      t.string :title
      t.string :content
      t.string :approval_status, default: "pending"

      t.timestamps null: false
    end
    add_foreign_key :requests, :users
  end
end
