class ChangeJobTypeColumnName < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.remove :type
      t.string :job_type
    end
  end
end
