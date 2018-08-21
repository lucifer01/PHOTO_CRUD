class CreatePics < ActiveRecord::Migration[5.2]
  def change
    create_table :pics do |t|
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
