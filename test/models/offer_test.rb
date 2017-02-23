require 'test_helper'

describe Offer do
  let(:offer) { Offer.new }

  it 'must be valid' do
    value(offer).must_be :valid?
  end
end
