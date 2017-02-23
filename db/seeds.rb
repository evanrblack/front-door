def randomize_user(user)
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
end

Admin.create(login: Login.new(email: 'admin@example.com',
                              password: 'wordpass'),
             first_name: Faker::Name.first_name,
             last_name: Faker::Name.last_name,
             phone_number: '479-555-0001')
Agent.create(login: Login.new(email: 'agent@example.com',
                              password: 'wordpass'),
             first_name: Faker::Name.first_name,
             last_name: Faker::Name.last_name,
             phone_number: '479-555-0002',
             street_address: '3053 N. College Avenue',
             city: 'Fayetteville',
             state: 'AR',
             zip_code: '72703',
             license_number: '1234567')

client = Client.create(login: Login.new(email: 'client@example.com',
                                        password: 'wordpass'),
                       first_name: Faker::Name.first_name,
                       last_name: Faker::Name.last_name,
                       phone_number: '479-555-0003')

Listing.create(client: client,
               street_address: '1 W. Center Street',
               city: 'Fayetteville',
               state: 'AR',
               zip_code: '72701',
               property_type: 'commercial',
               bedrooms: 0,
               full_bathrooms: 1,
               half_bathrooms: 3,
               square_feet: 8_000,
               year_built: 1911,
               asking_price: 2_000_000,
               description: 'It is the old post office!',
               showing_instructions: 'Show off the kitchen.')
