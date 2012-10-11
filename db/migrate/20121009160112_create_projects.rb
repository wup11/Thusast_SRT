class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :department
      t.string :name
      t.integer :user_id
      t.integer :author1
      t.integer :author2
      t.integer :author3
      t.integer :author4
      t.string :professor
      t.string :status
      t.string :prize

      t.timestamps
    end
  end
end
