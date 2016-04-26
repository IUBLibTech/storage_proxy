class CreateCacheFiles < ActiveRecord::Migration
  def change
    create_table :cache_files do |t|
      t.string :name
      t.string :status
      t.string :url
      t.references :cache, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
