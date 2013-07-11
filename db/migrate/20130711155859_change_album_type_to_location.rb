class ChangeAlbumTypeToLocation < ActiveRecord::Migration
  def up
    remove_column :albums, :type
    add_column :albums, :location, :string
  end

  def down
    remove_column :albums, :location
    add_column :albums, :type, :string
  end
end
