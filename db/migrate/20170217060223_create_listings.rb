class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.belongs_to :client
      t.belongs_to :agent
      
      t.string :street_address, null: false
      t.string :extra_address
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.float :latitude
      t.float :longitude
      
      t.integer :bedrooms, null: false
      t.integer :full_bathrooms, null: false
      t.integer :half_bathrooms, null: false
      t.integer :square_feet, null: false
      t.integer :year_built, null: false
      t.integer :asking_price, null: false
      t.integer :sales_price

      t.text :directions
      t.text :showing_instructions
      
      t.string :mls_number
      t.string :mls_association
      
      t.timestamps
    end
  end
end
