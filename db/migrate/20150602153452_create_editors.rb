class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
