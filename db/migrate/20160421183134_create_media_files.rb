class CreateMediaFiles < ActiveRecord::Migration
  def change
    create_table :media_files do |t|
      t.string :name
      t.references :store, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
