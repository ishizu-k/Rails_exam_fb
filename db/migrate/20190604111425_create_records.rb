class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :content
      t.text :image

      t.timestamps
    end
  end
end
