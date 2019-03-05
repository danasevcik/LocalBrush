class AddUserNameAndPassToPainters < ActiveRecord::Migration[5.2]
  def change
    add_column :painters, :username, :string
    add_column :painters, :password_digest, :string
  end
end
