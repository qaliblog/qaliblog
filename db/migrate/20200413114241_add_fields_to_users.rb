class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :text
    add_column :users, :lastname, :text
    add_column :users, :phonenumber, :integer
  end
end
