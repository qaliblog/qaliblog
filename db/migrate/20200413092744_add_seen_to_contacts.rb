class AddSeenToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :seen, :boolean, default: false
  end
end
