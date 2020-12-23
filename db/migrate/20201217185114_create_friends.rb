class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.string :full_name
      t.string :email
      t.string :twitter
      t.integer :phone_number

      t.timestamps
    end
  end
end
