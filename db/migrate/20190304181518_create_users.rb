class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :zip_code
      t.string :email
      t.string :house_style

      t.timestamps
    end
  end
end
