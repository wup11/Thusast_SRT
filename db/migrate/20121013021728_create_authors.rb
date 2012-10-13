class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :authorname
      t.string :department
      t.string :class_name
      t.string :mail
      t.string :phone
      t.string :stunum
      t.string :grade
      t.string :credit
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
