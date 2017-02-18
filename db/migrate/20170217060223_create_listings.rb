class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.belongs_to :client
      t.belongs_to :agent
      
      t.string :street_address
      t.string :extra_address
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.float :latitude
      t.float :longitude

      t.integer :property_type
      t.integer :bedrooms
      t.integer :full_bathrooms
      t.integer :half_bathrooms
      t.integer :square_feet
      t.integer :year_built

      t.integer :asking_price
      t.text :description
      t.text :showing_instructions

      t.string :mls_number
      t.string :mls_association
      t.datetime :listed_at

      t.integer :sales_price
      t.datetime :sold_at

      t.timestamps
    end
  end
end
