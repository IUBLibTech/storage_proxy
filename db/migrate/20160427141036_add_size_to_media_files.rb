class AddSizeToMediaFiles < ActiveRecord::Migration
  def change
    add_column :media_files, :size, :string
    add_column :media_files, :checksum, :string
  end
end
