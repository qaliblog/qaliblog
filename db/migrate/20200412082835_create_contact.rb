class CreateContact < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
