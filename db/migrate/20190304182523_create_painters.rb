class CreatePainters < ActiveRecord::Migration[5.2]
  def change
    create_table :painters do |t|
      t.string :name
      t.integer :zip_code
      t.integer :y_of_exp
      t.string :email

      t.timestamps
    end
  end
end
