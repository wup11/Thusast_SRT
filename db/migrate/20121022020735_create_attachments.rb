class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.integer :user_id

      t.timestamps
    end
  end
end
