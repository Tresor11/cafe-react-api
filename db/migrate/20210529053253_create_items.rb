class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.string :type
      t.integer :price
      t.string :image
      t.timestamps
    end
  end
end
