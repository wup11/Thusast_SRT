class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :department
      t.string :class
      t.integer :stunum
      t.string :phone
      t.string :mail
      t.integer :credit
      t.integer :grade

      t.timestamps
    end
  end
end
