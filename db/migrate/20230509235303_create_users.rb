class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.boolean :admin, :boolean, default: false

      t.timestamps
    end
    add_index :users, :email
  end
end
