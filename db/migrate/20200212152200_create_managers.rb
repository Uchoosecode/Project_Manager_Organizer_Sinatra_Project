class CreateManagers < ActiveRecord::Migration
  
  def change
    create_table :managers do |t|
      t.string :name
      t.string :password_digest 
      t.string :email
      t.timestamps
    end
  end
end
