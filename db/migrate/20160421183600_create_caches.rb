class CreateCaches < ActiveRecord::Migration
  def change
    create_table :caches do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
