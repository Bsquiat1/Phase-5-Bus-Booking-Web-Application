class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :admin, foreign_key: true, null: false
      

      t.timestamps
    end
  end
end
