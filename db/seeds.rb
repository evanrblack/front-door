require 'faker'

def randomize_user(user)
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
end

admin = Admin.create(email: 'admin@example.com',
                     password: 'wordpass',
                     first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     phone_number: '479-555-0001')

agent = Agent.create(email: 'agent@example.com',
                     password: 'wordpass',
                     first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     phone_number: '479-555-0002')

client = Client.create(email: 'client@example.com',
                       password: 'wordpass',
                       first_name: Faker::Name.first_name,
                       last_name: Faker::Name.last_name,
                       phone_number: '479-555-0003')

listing = Listing.create(client: client,
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
