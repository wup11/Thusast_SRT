class CreateAdminconfigs < ActiveRecord::Migration
  def change
    create_table :adminconfigs do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
