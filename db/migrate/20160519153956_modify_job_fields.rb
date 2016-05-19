class ModifyJobFields < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.remove :identifier, :media_file, :cache, :completed
      t.string :status
    end
  end
end
