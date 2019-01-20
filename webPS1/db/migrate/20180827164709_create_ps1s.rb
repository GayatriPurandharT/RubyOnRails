class CreatePs1s < ActiveRecord::Migration[5.2]
  def change
    create_table :ps1s do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
