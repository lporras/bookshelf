class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_superadmin

      t.timestamps
    end
  end
end
