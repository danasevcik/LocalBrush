class AddPhotoToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :photo, :string
  end
end
