class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :logins do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at

      # User type
      t.references :loginable, polymorphic: true, index: true
      
      t.timestamps null: false
    end

    create_table :admins do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false

      t.timestamps null: false
    end

    create_table :agents do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false

      t.string :street_address
      t.string :extra_address
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.float :latitude, null: false, default: 0.0
      t.float :longitude, null: false, default: 0.0
      
      t.string :license_number, null: false
      
      t.timestamps null: false
    end

    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      
      t.timestamps null: false
    end

    add_index :logins, :email, unique: true
    add_index :logins, :reset_password_token, unique: true
    # add_index :logins, :confirmation_token,   unique: true
  end
end
