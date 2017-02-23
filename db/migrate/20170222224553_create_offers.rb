class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.belongs_to :listing, null: false
      t.integer :direction, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.string :buyer_name, null: false
      t.integer :price, null: false
      t.date :closing_date
      t.text :notes

      t.timestamps
    end
  end
end
