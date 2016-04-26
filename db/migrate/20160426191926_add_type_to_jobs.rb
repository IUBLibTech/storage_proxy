class AddTypeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :type, :string
    add_column :jobs, :media_file, :string
    add_column :jobs, :cache, :string
    add_column :jobs, :completed, :boolean, default: false
  end
end
