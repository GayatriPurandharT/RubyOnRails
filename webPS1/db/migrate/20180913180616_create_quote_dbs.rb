class CreateQuoteDbs < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_dbs do |t|
      t.text :quote
      t.string :author
      t.string :category

      t.timestamps
    end
  end
end
