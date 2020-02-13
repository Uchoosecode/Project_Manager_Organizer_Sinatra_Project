class CreateProjects < ActiveRecord::Migration
  
  def change
    create_table :projects do |t|
      t.string :name
      t.string :project_type
      t.date  :due_date
      t.date  :start_date
      t.belongs_to :manager
      t.timestamps
    end

  end
end
