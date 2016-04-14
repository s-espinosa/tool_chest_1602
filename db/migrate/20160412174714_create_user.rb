class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
    end
  end
end
