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

      t.float :latitude, null: false, default: 0.0
      t.float :longitude, null: false, default: 0.0

      t.integer :property_type, null: false
      t.integer :bedrooms, null: false, default: 0
      t.integer :full_bathrooms, null: false, default: 0
      t.integer :half_bathrooms, null: false, default: 0
      t.integer :square_feet, null: false
      t.integer :year_built, null: false

      t.integer :asking_price, null: false
      t.text :description
      t.text :showing_instructions

      t.string :mls_number
      t.string :mls_association
      t.datetime :mls_at

      t.timestamps
    end
  end
end
